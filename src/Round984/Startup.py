for _ in range(int(input())):
    n, k = map(int, input().split())
    mp = [0]*k
    for i in range(k):
        b, c = map(int, input().split())
        mp[b-1] += c
    mp.sort(reverse=True)
    print(sum(mp[:min(n, k)]))
