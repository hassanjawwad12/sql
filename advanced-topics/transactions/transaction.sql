BEGIN;

-- Deduct amount from sender's account
UPDATE accounts 
SET balance = balance - 100 
WHERE id = 1 
RETURNING balance AS sender_new_balance;

-- Check if sender has sufficient balance
DO $$
DECLARE
    sender_balance NUMERIC;
BEGIN
    SELECT balance INTO sender_balance FROM accounts WHERE id = 1;
    IF sender_balance < 0 THEN
    -- can also add -- Explicit rollback if insufficient funds
    -- ROLLBACK;
        RAISE EXCEPTION 'Insufficient funds in sender account';
    END IF;
END $$;

-- Add amount to receiver's account
UPDATE accounts 
SET balance = balance + 100 
WHERE id = 2 
RETURNING balance AS receiver_new_balance;

-- Log the transaction
INSERT INTO transactions (sender_id, receiver_id, amount, transaction_date)
VALUES (1, 2, 100, NOW());

COMMIT;