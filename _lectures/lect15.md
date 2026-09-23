---
num: "lect14"
sequence: 15
desc: "Graph Search: Depth first traversal"
ready: false
pre-reading: "Savitch: 15.4"
pdfurl: /lectures/CS24_Graph_DFT.pdf
annotatedready: false
annotatedpdfurl: /lectures/CS24_Graph_DFT_ann.pdf
---



# Lecture Plan

### 1. DFS Visualizer

Step through the DFS algorithm on a small graph — trace the call stack, see how backtracking works, and understand why a single call to `exploreDFS(v)` is not enough for a disconnected graph. The third mode shows the outer loop in `DepthFirstSearch(G)` that handles disconnected components.

[Interactive DFS Visualizer]({{site.baseurl}}/assets/dfs_viz.html){:target="_blank"}

---

### 2. LeetCode Problem: Keys and Rooms

Apply DFS to a new graph problem. Given the DFS pattern from the visualizer, identify what the graph is, what the visited set tracks, and how to detect whether all rooms are reachable.

[Keys and Rooms](https://leetcode.com/problems/keys-and-rooms/description/){:target="_blank"}

Input:  vector<vector<int>> rooms = [[1],[2, 3],[1],[]]
Output: ?

Discuss with your peer (5 mins):
1. What are the nodes and what are the edges in this problem?                                                                                                 
2. What does the input (rooms) represent in graph terms?  
  
---

### 3. DFS Applied to PA03: Backpropagation

The neural network is a directed graph where edges only go forward. To compute the nudge (delta) for each weight, you need values from nodes in the next layer — but there is no backward edge to follow. The recursive DFS naturally solves this: dive to the output first, compute the error there, then pass results back up the call stack. A contributions map (memoization) ensures each node is computed only once.

[Interactive Backpropagation Visualizer (PA03)]({{site.baseurl}}/assets/backprop_viz.html){:target="_blank"}

**What this visualizer does not show — questions for the curious student:**

- How is the error signal at the output node actually computed? What formula seeds the backward pass, and where does it come from?
- Why do these weight updates actually make predictions better? What guarantees that subtracting a delta moves the network in the right direction?
- Why does the learning rate matter? What goes wrong if it is too large or too small?
- Why average the deltas across a batch of training examples rather than updating after each one?

These videos answer those questions, visually and without heavy math:
- [3Blue1Brown — Gradient descent, how neural networks learn](https://youtu.be/IHZwWFHWa-w?si=_e4wkFW624ari842) (20 min)
- [3Blue1Brown — Backpropagation, intuitively](https://youtu.be/Ilg3gGewQ5U?si=ANRSwDucsfT5BFbN) (20 min)

To see a real neural network train live in your browser — adjusting weights, watching the decision boundary shift, experimenting with architecture and learning rate:
- [TensorFlow Playground](https://playground.tensorflow.org/#activation=tanh&batchSize=10&dataset=circle&regDataset=reg-plane&learningRate=0.03&regularizationRate=0&noise=0&networkShape=4,2&seed=0.23990&showTestData=false&discretize=false&percTrainData=50&x=true&y=true&xTimesY=false&xSquared=false&ySquared=false&cosX=false&sinX=false&cosY=false&sinY=false&collectStats=false&problem=classification&initZero=false&hideText=false){:target="_blank"}




