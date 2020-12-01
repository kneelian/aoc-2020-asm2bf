stk 3
; BFI tosses an error if the stack is 2

org 0

db 1446
db 1893
db 1827
db 1565
db 1728
db 497
db 1406
db 1960
db 1986
db 1945
db 1731
db 1925
db 1550
db 1841
db 1789
db 1952
db 1610
db 1601
db 1776
db 1808
db 1812
db 1834
db 1454
db 1729
db 513
db 1894
db 1703
db 1587
db 1788
db 1690
db 1655
db 1473
db 1822
db 1437
db 1626
db 1447
db 1400
db 1396
db 1715
db 1720
db 1469
db 1388
db 1874
db 1641
db 518
db 1664
db 1552
db 1800
db 512
db 1506
db 1806
db 1857
db 1802
db 1843
db 1956
db 1678
db 1560
db 1971
db 1940
db 1847
db 1902
db 1500
db 1383
db 1386
db 1398
db 1535
db 1713
db 1931
db 1619
db 1519
db 1897
db 1767
db 1548
db 1976
db 1984
db 1426
db 914
db 2000
db 1585
db 1634
db 1832
db 1849
db 1665
db 1609
db 1670
db 1520
db 1490
db 1746
db 1608
db 1829
db 1431
db 1762
db 1384
db 1504
db 1434
db 1356
db 1654
db 1719
db 1599
db 1686
db 1489
db 1377
db 1531
db 1912
db 144
db 1875
db 1532
db 1439
db 1482
db 1420
db 1529
db 1554
db 1826
db 1546
db 1589
db 1993
db 1518
db 1708
db 1733
db 1876
db 1953
db 1741
db 1689
db 773
db 1455
db 1613
db 2004
db 1819
db 1725
db 1617
db 1498
db 1651
db 2007
db 1402
db 728
db 1475
db 1928
db 1904
db 1969
db 1851
db 1296
db 1558
db 1817
db 1663
db 1750
db 1780
db 1501
db 1443
db 1734
db 1977
db 1901
db 1547
db 1631
db 1644
db 1815
db 1949
db 1586
db 1697
db 1435
db 1783
db 1772
db 1987
db 1483
db 1372
db 1999
db 1848
db 1512
db 1541
db 1861
db 2008
db 1607
db 1622
db 1629
db 1763
db 1656
db 1661
db 1581
db 1968
db 1985
db 1974
db 1882
db 995
db 1704
db 1896
db 1611
db 1888
db 1773
db 1810
db 1650
db 1712
db 1410
db 1796
db 1691
db 1671
db 1947
db 1775
db 1593
db 656
db 1530
db 1743
db 0
; Hardcoded input

mov r1, 0
mov r2, 0
mov r3, 0
mov r4, 0
mov r5, 0
mov r6, 0

?jez=jz
; jump equal to zero
?cpsh=cps
?cpop=cpo
?cjmp=cjn
?cjez=cjz
?cmov=cmo
; conditional push and pop, jump, jumpzero, move

; r1 is mem pointer for x
; r2 is currently accessed mem location for x
; r3 is mem pointer for y
; r4 is currently accessed mem location for y
; r5 is temp

@mainloop
; check if we finished looping ==> r1 + r2 = 2020
; otherwise return to beginning of loop

	rcl r2, r1
	inc r1
	
	ceq r2, 0
	cjmp %parttwo
	
	@innerloop
		
		rcl r4, r3
		inc r3
		
		mov r5, r2
		add r5, r4
		
		ceq r5, 2020
		cpsh r2
		cpsh r4
		cjmp %parttwo

		ceq r4, 0
		cmov r3, r1
		cjmp %mainloop
		
		jmp %innerloop
	
	jmp %mainloop
	
@parttwo
	pop r1
	out r1
	pop r2
	out r2
	mul r1, r2
	out r1
