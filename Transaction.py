import hashlib
import json
import time

class Transaction:
    def __init__(self, sender, reciever, amount):
        self.sender = sender
        self.reciever = reciever
        self.amount = amount
        self.timestamp = time.time()

    def _to_dict(self):
        return{
            "sender":self.reciever,
            "reciever": self.reciever,
            "amount": self.amount,
            "timestamp": self.timestamp
        }
class Block:
    def __init__(self, transactions, previous_hash):
        self.transactions = [tx.to_dict() for tx in transactions]
        self.previous_hash = previous_hash
        self.nonce = 0
        self.timestamp = time.time()
        self.hash = self.calculate_hash()
    
    def calculate_hash(self):

        block_string = json.dumps({
            "transactions": self.transactions,
            "previous_hash": self.previous_hash,
            "nonce":self.nonce,
            "timestamp":self.timestamp
        }, sort_keys=True).encode()

        return hashlib.sha256(block_string).hexdigest()
    

if __name__=="__main__":
    t1 = Transaction("Shubham", "Deepwork", 100)
    new_block = Block([t1], "000000000000000")
    print(f"Block Hash: {new_block.hash}")
    