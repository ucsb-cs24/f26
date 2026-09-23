---
num: "lect16"
sequence: 18
desc: "Complexity Analysis Revisited: Graph Search and std::set"
ready: false
pdfurl: /lectures/CS24_ComplexityAnalysisRevisited.pdf
annotatedready: false
annotatedpdfurl: /lectures/CS24_ComplexityAnalysisRevisited_ann.pdf
---

## Topics

### Complexity of Graph Search
* BFS and DFS both run in O(V + E) — why?
  - Every vertex is visited once (V)
  - Every edge is examined once (E)
  - Representation matters: adjacency list vs adjacency matrix
* Space complexity: BFS uses a queue (O(V)), DFS uses the call stack (O(V))

### Complexity of Mergesort
* Divide: O(log n) levels of recursion
* Conquer: O(n) work at each level
* Total: O(n log n) — compare to O(n²) for insertion/selection sort

### BST Iteration with `std::set`
* `std::set` is implemented as a balanced BST
* Iterating over a `std::set` in order is an in-order DFS traversal
* In-order traversal runs in O(n) — visits every node exactly once
* Connecting iterator behavior to the underlying graph structure

## Code from lecture
[{{site.lect_repo}}/tree/main/{{page.num}}]({{site.lect_repo}}/tree/main/{{page.num}})
