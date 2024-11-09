for _ in range(int(input())):
    l, r, k = map(int, input().split())
    if (k == 1):
        print(r-l+1)
        continue
    start = r // k;
    if start < l:
        print(0)
        continue
    elif start == l:
        print(1)
        continue
    print(start - l+1)
