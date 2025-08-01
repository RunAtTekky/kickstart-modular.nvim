-- File: ~/.config/nvim/luasnip/cpp.lua
local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node -- Only use t() for static parts
local i = ls.insert_node
local rep = require('luasnip.extras').rep
local fmta = require('luasnip.extras.fmt').fmta -- Still useful for dynamic parts

return {
  -- My very basic CP Template
  s(
    { trig = 'runat', dscr = 'My very basic CP Template' },
    t {
      '#include <bits/stdc++.h>',
      'using namespace std;',
      '',
      'typedef long long ll;',
      '',
      'void solve() {',
      '    ll n; cin >> n;',
      '}',
      '',
      'int main() {',
      'ios_base::sync_with_stdio(false); cin.tie(NULL);',
      '    int t=1; cin >> t;',
      '    while (t--) solve();',
      '}',
      '',
    }
  ),

  -- Disjoint Set Union Template
  s(
    { trig = 'DSU', dscr = 'Disjoint Set Union' },
    t {
      'class DSU {',
      'private:',
      '    vector<int> parent;',
      '    vector<int> size;',
      '    int count = 0;',
      '',
      'public:',
      '    DSU(int n) : parent(n), size(n,1) {',
      '        iota(parent.begin(), parent.end(), 0);',
      '        count = n;',
      '    }',
      '',
      '    int find(int x) {',
      '        return parent[x] == x ? x : parent[x] = find(parent[x]);',
      '    }',
      '',
      '    void connect(int a, int b) {',
      '        a = find(a);',
      '        b = find(b);',
      '        if (a != b) {',
      '            if (size[a] < size[b])',
      '                swap(a, b);',
      '            parent[b] = a;',
      '            size[a] += size[b];',
      '            count--;',
      '        }',
      '    }',
      '',
      '    bool connected(int a, int b) {',
      '        return find(a) == find(b);',
      '    }',
      '',
      '    int components() {',
      '        return count;',
      '    }',
      '',
      '    int componentSize(int x) {',
      '        return size[find(x)];',
      '    }',
      '};',
    }
  ),

  -- Trie
  s(
    { trig = 'trieclass_static', dscr = 'Full Trie Data Structure Implementation (Static)' },
    t {
      'class Trie {',
      '',
      'public:',
      '',
      '    // n is number of possible characters in a string',
      '    const static int N = 26;',
      '',
      '    // BaseChar defines the base character for possible characters',
      "    // Like '0' for '0','1','2'... as possible characters in string",
      "    const static char baseChar = 'a';",
      '',
      '    struct TrieNode {',
      '        int next[N];',
      '        // If isEnd is set to true , a string ended here',
      '        bool isEnd;',
      '        // Freq is how many times this prefix occurs',
      '        int freq;',
      '',
      '        TrieNode() {',
      '            for(int i=0;i<N;i++) next[i] = -1;',
      '            isEnd = false;',
      '            freq = 0;',
      '        }',
      '    };',
      '',
      '    // The implementation is via vector and each position in this vector',
      '    // Is similar as new pointer in pointer type implementation',
      '    vector <TrieNode> tree;',
      '',
      '    // Base Constructor',
      '    Trie () {',
      '        tree.push_back(TrieNode());',
      '    }',
      '',
      '    // Inserting a string in trie',
      '    void insert(const string& s) {',
      '        // p is the current node index',
      '        int p = 0;',
      '        tree[p].freq++;',
      '        for(int i=0;i<s.size();i++) {',
      '            if(tree[p].next[s[i]-baseChar] == -1) {',
      '                tree.push_back(TrieNode());',
      '                // We are pointing to the index of newly created node',
      '                tree[p].next[s[i]-baseChar] = tree.size()-1;',
      '            }',
      '',
      '            // Point to the index of the character s[i]',
      '            p = tree[p].next[s[i]-baseChar];',
      '            tree[p].freq++;',
      '        }',
      '        tree[p].isEnd = true;',
      '    }',
      '',
      '    // Check if a string exists as prefix',
      '    bool checkPrefix(const string &s) {',
      '        int p = 0;',
      '        for(int i=0;i<s.size();i++) {',
      '            if(tree[p].next[s[i]-baseChar] == -1) return false;',
      '',
      '            p = tree[p].next[s[i]-baseChar];',
      '        }',
      '        return true;',
      '    }',
      '',
      '    // Check is string exists',
      '    bool checkString(const string &s) {',
      '        int p = 0;',
      '        for(int i=0;i<s.size();i++) {',
      '            if(tree[p].next[s[i]-baseChar] == -1) return false;',
      '',
      '            p = tree[p].next[s[i]-baseChar];',
      '        }',
      '',
      '        return tree[p].isEnd;',
      '    }',
      '',
      '    // Persistent insert',
      '    // Returns location of new head',
      '    int persistentInsert(int head , const string &s) {',
      '        int old = head;',
      '',
      '        tree.push_back(TrieNode());',
      '        int now = tree.size()-1;',
      '        int newHead = now;',
      '',
      '        int i,j;',
      '',
      '        for(i=0;i<s.size();i++) {',
      '            if(old == -1) {',
      '                tree.push_back(TrieNode());',
      '                tree[now].next[s[i]-baseChar] = tree.size() - 1;',
      '                tree[now].freq++;',
      '                now = tree[now].next[s[i]-baseChar];',
      '                continue;',
      '            }',
      '',
      '            for(j=0;j<N;j++) tree[now].next[j] = tree[old].next[j];',
      '',
      '            tree[now].freq = tree[old].freq;',
      '            tree[now].isEnd = tree[old].isEnd;',
      '',
      '            tree[now].freq++;',
      '',
      '            tree.push_back(TrieNode());',
      '            tree[now].next[s[i]-baseChar] = tree.size()-1;',
      '',
      '            old = tree[old].next[s[i]-baseChar];',
      '            now = tree[now].next[s[i]-baseChar];',
      '        }',
      '',
      '        tree[now].freq++;',
      '        tree[now].isEnd = true;',
      '',
      '        return newHead;',
      '    }',
      '',
      '    // Persistent check prefix',
      '    bool persistentCheckPrefix(int head, const string &s) {',
      '        int p = head;',
      '        for(int i=0;i<s.size();i++) {',
      '            if(tree[p].next[s[i]-baseChar] == -1) return false;',
      '',
      '            p = tree[p].next[s[i]-baseChar];',
      '        }',
      '        return true;',
      '    }',
      '',
      '    // Persistent check string',
      '    bool persistentCheckString(int head, const string &s) {',
      '        int p = head;',
      '        for(int i=0;i<s.size();i++) {',
      '            if(tree[p].next[s[i]-baseChar] == -1) return false;',
      '',
      '            p = tree[p].next[s[i]-baseChar];',
      '        }',
      '        return tree[p].isEnd;',
      '    }',
      '};',
    }
  ),

  s(
    { trig = 'print1', dscr = 'Print one' },
    fmta(
      [[
cout <<<< <> <<<< "\n";
]],
      {
        i(1),
      }
    )
  ),

  s(
    { trig = 'print2', dscr = 'Print two' },
    fmta(
      [[
cout <<<< <> <<<< " " <<<< <> <<<< "\n";
]],
      {
        i(1),
        i(2),
      }
    )
  ),

  s(
    { trig = 'print3', dscr = 'Print three' },
    fmta(
      [[
cout <<<< <> <<<< " " <<<< <> <<<< " " <<<< <> <<<< "\n";
]],
      {
        i(1),
        i(2),
        i(3),
      }
    )
  ),

  -- YESNO
  s(
    { trig = 'yesno', dscr = 'Define yes and no' },
    t {
      '#define YES cout << "YES\\n"',
      '#define NO cout << "NO\\n"',
    }
  ),

  -- Take vector input
  s(
    { trig = 'vecin', dscr = 'Take vector input' },
    fmta(
      [[
vector<<int>> <>(<>);
for (auto &<> : <>) cin >>>> <>;

]],
      {
        i(1),
        i(2),
        i(3),
        rep(1),
        rep(3),
      }
    )
  ),

  -- Vector Output
  s(
    { trig = 'vecout', dscr = 'Vector Output' },
    fmta(
      [[
for (auto &<> : <>) cout <<<< <> <<<< " ";
cout <<<< "\n";

]],
      {
        i(1),
        i(2),
        rep(1),
      }
    )
  ),

  -- Simple macro for debugging
  s({ trig = 'debug', dscr = 'Simple macro for debugging' }, t "#define debug(x) cerr << #x << ' ' << x << '\\n';"),
}
