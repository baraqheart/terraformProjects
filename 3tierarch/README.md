Resources to create
1. vpc
2. subnets:
      availability zone 1:
       - web public subnet
         app private subnet
         db private subnet
      
      availability zone 2:
       - web public subnet in az2
         app private subnet in az2
         db private subnet in az2

3. Route tables:
     - public route table
       private route table

4. Internet gateway
5. NAT gateway
6. Load balancer
7. security groups:
      - app security group
        web security group
        db security group
 
8. instances:
      - jump server
        app server
        db server


