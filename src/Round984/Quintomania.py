for _ in range(int(input())):
    n = int(input())
    m = list(map(int, input().split()))
    i = 0
    while (i < n-1) and (abs(m[i] - m[i+1]) == 5 or abs(m[i] - m[i+1]) == 7):
        i += 1
    if i == n-1:
        print("YES")
    else:
        print("NO")
