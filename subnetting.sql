Subnetting class project
=======================================================================================================================
												Questions
=======================================================================================================================
	1. Identify the subnet mask, cidr range, broadcastip, network ip, first and last usable address of the following IP
		156.54.1.24

	2. Create 6 subnets from the IP and give the same details as above for all subnet ranges

1a) Subnet mask:
	This ip can belong to many posible network. in our case we will us clasfull addressing 
	Class of the IP is falls in class B: range is (128.0.0 - 191.255.255.255)
	Subnetmas of class B : 255.255.0.0

b) Cidr Range:
	from our subnet we can convert to binary
	255.255.0.0 --> 1111111.11111111.00000000.00000000
					  8    +   8    +   0     +  0  = 16
	 Cidr = /16

c)   network ip: From our IP 156.54.1.24 we will convert to binary

	 		128		64		32		16 		8 		4 		2 		1
	 	156: 1       0 		 0		 1      1   	1       0       0
	 	54 : 0       0		 1 		 1 		0 		1       1       0
	 	 1 : 0 		 0       0       0      0       0       0       1
	 	24 : 0       0       0       1      1       0       0       0

	 	 IP   		: 10011100.00110110|.00000001.00011000
	 	Subnet mask : 11111111.11111111|.00000000.00000000
	 	Network IP  : 10011100.00110110 .00000000.00000000

	 	Convert to Decimal: 156.54.0.0/16

	 Network Ip has zeros in the last octet of the host portion(the first IP from the subnet)

d)broadcastip 
	 From the subnet mask 11111111.11111111|.00000000.00000000 first 16 represent Network portion(unchanged) and the remaning rep host portion(can change)
	 from the class broadcastip is the last network so the host portion of our ip should have all 1s to be the last network broadcastip
	 10011100.00110110 .00000000.00000000 --> 10011100.00110110 .11111111.11111111

	 convert to Decimal :156.54.255.255 

	 Broadcast IP has all 1s at on the last octet of the host portion.

				
e)	first usable address : Network IP +1 
						  156.54.0.0 + 1

						  156.54.0.1

f) last usable address  : Broadcast IP - 1
						 156.54.255.255 -1

						 156.54.255.254

2. Create 6 subnets from the IP and give the same details as above for all subnet ranges

We need to know number of bits to be added to our subnet mask
from this formular 2^n=Network we can say n -s the bits

 Bits						Network                  
===============================================
	0 							1
	1 							2
	2 							4
	------------------------------
	3 							8 <----------
	------------------------------
	4 							16
	5 							32
	6 							64
	7 							128
	8 							256
	9 							512
	10 							1024
===============================================

From the required subnets 6 we will check where these 6 networks can fit and take the coresponding bits which is 3

For our new subnet mask we will add 3 bits to the previous subnet mask to get /19 for each subnet.
this will generate 2^(32-19) =8192 addrs

1. First Subnet

Previous Subnet : 11111111.11111111|00000000.00000000 ---> 255.255.0.0 
New Subnet      : 11111111.11111111.111|00000.00000000 ---> 255.255.0.0 ( 128 	64		32		16 		8 		4 		2 		1)using the third octet since others are know
																			1    1 		 1       0      0       0       0       0 = 128+64+32 = 224
													  ---> 255.255.224.0


	IP   		: 10011100.00110110|000|00001.00011000
	Subnet mask : 11111111.11111111|111|00001.00000000 --->255.255.224.0
	Network IP  : 10011100.00110110|000 00000.00000000 --->156.54.0.0
	broadcastip : 10011100.00110110|000 11111.11111111 --->156.54.31.255 ( 128 	64		32		16 		8 		4 		2 		1)
																			0    0       0        1     1       1       1       1 = 16+8+4+2+1 = 31
	First usable address 156.54.0.0 + 1   = 156.54.0.1
	last usable address  156.54.31.255 -1 = 156.54.31.254


2. 2nd Subnet: 
	IP   		: 10011100.00110110|000|00001.00011000
	Subnet mask : 11111111.11111111|111|00001.00000000 --->255.255.224.0
	Network IP  : 10011100.00110110|001 00000.00000000 --->156.54.32.0 ( 128 	64		32		16 		8 		4 		2 		1) third octet
																		0        0      1        0      0       0       0       0 = 32

	broadcastip : 10011100.00110110.001 11111.11111111 --->156.54.63.255 ( 128 	64		32		16 		8 		4 		2 		1)
																			0    0       1        1     1       1       1       1 = 63
	First usable address 156.54.32.0 + 1   = 156.54.32.1
	last usable address  156.54.63.255 -1 = 156.54.63.254

3. 3rd Subnet: 
	IP   		: 10011100.00110110|000|00001.00011000
	Subnet mask : 11111111.11111111|111|00001.00000000 --->255.255.224.0
	Network IP  : 10011100.00110110|010 00000.00000000 --->156.54.64.0 ( 128 	64		32		16 		8 		4 		2 		1) third octet
																		  0      1      0        0      0       0       0       0 = 64

	broadcastip : 10011100.00110110|010 11111.11111111 --->156.54.95.255 ( 128 	64		32		16 		8 		4 		2 		1)
																			 0       1      0        1      1       1       1       1 = 95
	First usable address 156.54.64.0 + 1   = 156.54.64.1
	last usable address  156.54.95.255 -1 = 156.54.95.254


4. 4th Subnet: 
	IP   		: 10011100.00110110|000|00001.00011000
	Subnet mask : 11111111.11111111|111|00001.00000000 --->255.255.224.0
	Network IP  : 10011100.00110110|011 00000.00000000 --->156.54.96.0 ( 128 	64		32		16 		8 		4 		2 		1) third octet
																		  0      1      1        0      0       0       0       0 = 64+32 = 96

	broadcastip : 10011100.00110110|011 11111.11111111 --->156.54.127.255 ( 128 	64		32		16 		8 		4 		2 		1)
																			 0       1      1        1      1       1       1       1 = 95+32 = 127
	First usable address 156.54.96.0 + 1   = 156.54.96.1
	last usable address  156.54.127.255 -1 = 156.54.127.254

5. 5th Subnet: 
	IP   		: 10011100.00110110|000|00001.00011000
	Subnet mask : 11111111.11111111|111|00001.00000000 --->255.255.224.0
	Network IP  : 10011100.00110110|100 00000.00000000 --->156.54.128.0 ( 128 	64		32		16 		8 		4 		2 		1) third octet
																		  1      0       0       0      0       0       0       0 = 64+32 = 128

	broadcastip : 10011100.00110110|100 11111.11111111 --->156.54.159.255 ( 128 	64		32		16 		8 		4 		2 		1)
																			 1       0      0        1      1       1       1       1 = 95+32 = 159
	First usable address 156.54.128.0 + 1   = 156.54.128.1
	last usable address  156.54.159.255 -1 = 156.54.159.254

6. 6th Subnet: 
	IP   		: 10011100.00110110|000|00001.00011000
	Subnet mask : 11111111.11111111|111|00001.00000000 --->255.255.224.0
	Network IP  : 10011100.00110110|101 00000.00000000 --->156.54.160.0 ( 128 	64		32		16 		8 		4 		2 		1) third octet
																		  1      0       1       0      0       0       0       0 = 64+32 = 160

	broadcastip : 10011100.00110110|101 11111.11111111 --->156.54.191.255 ( 128 	64		32		16 		8 		4 		2 		1)
																			 1       0      1        1      1       1       1       1 = 95+32 = 191
	First usable address 156.54.128.0 + 1   = 156.54.128.1
	last usable address  156.54.191.255 -1 = 156.54.191.254