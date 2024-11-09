for _ in range(int(input())):
    n = int(input())
    s = list(input())
    r = list(input())
    count0 = 0
    count1 = 0
    for i in s:
        if i == '0':
            count0 += 1
        else:
            count1 += 1
    # print("Count1: ", count1, "Count0: ", count0)
    if (count0 == 0 or count1 == 0):
        print("NO")
    else:
        for i in r:
            # print("Count1: ", count1, "Count0: ", count0, "i: ", i)
            if i == '0':
                count1 -= 1
            else:
                count0 -= 1
            if (count1 == 0 or count0 == 0) and (count1 + count0 >= 2):
                print("NO")
                break
        if count1 + count0 == 1:
            print("YES")
