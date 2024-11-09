#include <bits/stdc++.h>

using namespace std;

void input(int &n1, vector<int> &nums) {
    cin >> n1;
    int temp;
    for (int i = 0; i < n1; i++) {
        cin >> temp;
        nums.push_back(temp);
    }
}

int f(int a, int b) {
    return a + (a < b) - (a > b);
}

int find_new_rating(int n1, vector<int> nums) {
    int i0 = 1;
    int i1 = -1*n1;
    int i2 = -1*n1;
    // i0 -> Current contest is before the skipped ones.
    // i1 -> Current contest is in the skipped ones.
    // i2 -> Current contest is after the skipped ones.
    for (int j = 1; j < n1; j++) {
        
        i2 = max(f(i1, nums[j]), f(i2, nums[j]));
        i1 = max(i1, i0);
        i0 = f(i0, nums[j]);
        // cout << "nums : " << nums[j] << " i2 : " << i2 << " i1 : " << i1 << " i0 : " << i0 << endl;
    }
    return max(i1, i2);
}

int main() {
    int n, n1, answer;
    vector<int> nums;
    cin >> n;
    for (int i = 0; i < n; i++) {
        nums.clear();
        input(n1, nums);
        answer = find_new_rating(n1, nums);
        cout << answer << endl;
    }
}
