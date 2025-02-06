# Name: Prince Nsidibe
# Course: BAN 642 - Programming in R and Python
# Date: 01-02-2025



import random

# Generate a list of 400 workers with dynamic data
workers = []
for i in range(400):
    worker = {
        "name": f"Worker {i+1}",
        "salary": random.randint(5000, 31000),
        "gender": random.choice(["Male", "Female"]),
    }
    workers.append(worker)

# Function to generate payment slips
def generate_payment_slips(workers):
    payment_slips = []
    for worker in workers:
        try:
            level = None
            if 10000 < worker["salary"] < 20000:
                level = "A1"
            elif 7500 < worker["salary"] < 30000 and worker["gender"] == "Female":
                level = "A5-F"
            
            if level:  # Only add workers who meet the conditions
                payment_slip = f"{worker['name']} (Level {level}): Salary ${worker['salary']}"
                payment_slips.append(payment_slip)

        except Exception as e:
            print(f"Error processing worker {worker['name']}: {e}")

    return payment_slips

# Generate and display payment slips
payment_slips = generate_payment_slips(workers)
for slip in payment_slips:
    print(slip)
