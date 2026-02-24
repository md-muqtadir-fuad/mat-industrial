### Exercise - 1: Simulation of Queuing Systems

A small grocery store has only one checkout counter. Customers arrive at this checkout counter at random from 1 to 8 minutes apart. Each possible value of inter-arrival time is the same probability of occurrence. The service times vary from 1 to 6 minutes with the probabilities shown in the table. The problem is to analyze the system by simulation for the arrival and service of 15 customers.

**Time Between Arrivals Distribution**

| Time between Arrivals (Minutes) | Probability | Cumulative Probability | Random Digit Assignment |
| :--- | :--- | :--- | :--- |
| 1 | 0.125 | 0.125 | 001-125 |
| 2 | 0.125 | 0.250 | 126-250 |
| 3 | 0.125 | 0.375 | 251-375 |
| 4 | 0.125 | 0.500 | 376-500 |
| 5 | 0.125 | 0.625 | 501-625 |
| 6 | 0.125 | 0.750 | 626-750 |
| 7 | 0.125 | 0.875 | 751-875 |
| 8 | 0.125 | 1.000 | 876-000 |

**Service Time Distribution**

| Service Time (Minutes) | Probability | Cumulative Probability | Random Digit Assignment |
| :--- | :--- | :--- | :--- |
| 1 | 0.10 | 0.10 | 01-10 |
| 2 | 0.20 | 0.30 | 11-30 |
| 3 | 0.30 | 0.60 | 31-60 |
| 4 | 0.25 | 0.85 | 61-85 |
| 5 | 0.10 | 0.95 | 86-95 |
| 6 | 0.05 | 1.00 | 96-00 |

**Find out:**
1. The average waiting time for a customer
2. The probability that a customer has to wait in the queue
3. The proportion of idle time of the server
4. The average service time
5. The average time between arrivals
6. The average waiting time of those who wait
7. The average time a customer spends in the system
----

### Exercise - 2: Simulation of Inventory System

Suppose that the maximum inventory label M is 11 units and the review period N is 5 days.The problem is to estimate by simulation (for 5 cycles) the average ending units in inventory and the number of days when a shortage condition existed. The distribution of the number of units demanded per day is shown in the table.Lead time is a random variable also shown in the table. Assume that the orders are placed at the close of business.



**Table 2: Random Digit Assignments for Daily Demand**

| Demand | Probability | Cumulative Probability | Random Digit Assignment |
| :--- | :--- | :--- | :--- |
| 0 | 0.10 | 0.10 | 01-10 |
| 1 | 0.25 | 0.35 | 11-35 |
| 2 | 0.35 | 0.70 | 36-70 |
| 3 | 0.21 | 0.91 | 71-91 |
| 4 | 0.09 | 1.00 | 92-100 |

**Table 1: Random Digit Assignments for Lead Time**

| Lead Time (Days) | Probability | Cumulative Probability | Random Digit Assignment |
| :--- | :--- | :--- | :--- |
| 1 | 0.6 | 0.6 | 1-6 |
| 2 | 0.3 | 0.9 | 7-9 |
| 3 | 0.1 | 1.0 | 0 |

**Assignment - 2**
Rework the above example for 10 cycles with M = 10

----

### Exercise - 3: Simulation of Reliability Problem

A large milling machine has three different bearings that fail in service. The cumulative distribution function of the life of each bearing is identical as shown in Table 1. When a bearing fails, the mill stops, a repairperson is called, and a new bearing is installed. 

The delay time of the repairperson's arriving at the milling machine is also a random variable, with the distribution given in Table 2. Downtime for the mill is estimated at $5 per minute. The direct on-site cost of the repairperson is $15 per hour. It takes 20 minutes to change one bearing, 30 minutes to change two bearings, and 40 minutes to change three bearings. The bearings cost $16 each. 

A proposal has been made to replace all three bearings whenever a bearing fails. Management needs an evaluation of this proposal.

**Table 1: Bearing-Life Distribution**

| Bearing Life (Hours) | Probability | Cumulative Probability | Random Digit Assignment |
| :--- | :--- | :--- | :--- |
| 1000 | 0.10 | 0.10 | 01-10 |
| 1100 | 0.13 | 0.23 | 11-23 |
| 1200 | 0.25 | 0.48 | 24-48 |
| 1300 | 0.13 | 0.61 | 49-61 |
| 1400 | 0.09 | 0.70 | 62-70 |
| 1500 | 0.12 | 0.82 | 71-82 |
| 1600 | 0.02 | 0.84 | 83-84 |
| 1700 | 0.06 | 0.90 | 85-90 |
| 1800 | 0.05 | 0.95 | 91-95 |
| 1900 | 0.05 | 1.00 | 96-00 |

**Table 2: Delay-Time Distribution**

| Delay Time (Minutes) | Probability | Cumulative Probability | Random Digit Assignment |
| :--- | :--- | :--- | :--- |
| 5 | 0.6 | 0.6 | 1-6 |
| 10 | 0.3 | 0.9 | 7-9 |
| 15 | 0.1 | 1.0 | 0 |

**Simulation Goal:**
Simulate the problem for 20,000 hours of operation. It will be assumed in this problem that the times are never exactly the same and thus no more than 1 bearing is changed at any breakdown. (Historical data: 16 bearing changes were made for bearings 1 and 2, but only 14 bearing changes were required for bearing 3).

----

### Exercise 4: The newspaper Seller's Problem

A paper seller buys the papers for 33 cents each and sells them for 50 cents each. Newspapers not sold at the end of the day are sold as scrap for 5 cents each. Newspapers can be purchased in the bundles of 10. Thus the paper seller can buy 50, 60 and so on. 

There are three types of newsdays, "good", "fair" and "pool", with probabilities of 0.35, 0.45 and 0.20. The distribution of papers demanded on each of these days are given below:

| Demand | Good | Fair | Poor |
| :--- | :--- | :--- | :--- |
| **40** | 0.03 | 0.10 | 0.44 |
| **50** | 0.05 | 0.18 | 0.22 |
| **60** | 0.15 | 0.40 | 0.16 |
| **70** | 0.20 | 0.20 | 0.12 |
| **80** | 0.35 | 0.08 | 0.06 |
| **90** | 0.15 | 0.04 | 0.00 |
| **100** | 0.07 | 0.00 | 0.00 |

The profits are given by the following relationship:
profit: revenue from sales - cost of newspapers- lost profit from excess demand - salvage from sales of scrap papers. 

The problem is to determine the optimum number of papers the seller should purchase. This will be accomplished by simulating demands for 20 day and recording profits from sales each day.

**Random digit assignment for type of newsday:**

| Type of newsday | Probability | Cumulative probability | Random digit assignment |
| :--- | :--- | :--- | :--- |
| **Good** | 0.35 | 0.35 | 01-35 |
| **Fair** | 0.45 | 0.80 | 36-80 |
| **Poor** | 0.20 | 1.00 | 81-100 |

**Random digit assignment for newspapers demanded:**

| Demand | Good | Fair | Poor |
| :--- | :--- | :--- | :--- |
| **40** | 01-03 | 01-10 | 01-44 |
| **50** | 04-08 | 11-28 | 45-66 |
| **60** | 09-23 | 29-68 | 67-82 |
| **70** | 24-43 | 69-88 | 83-94 |
| **80** | 44-78 | 89-96 | 95-00 |
| **90** | 79-93 | 97-00 | - |
| **100** | 94-00 | - | - |
