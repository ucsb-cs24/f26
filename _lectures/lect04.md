---
num: "lect04"
sequence: 4
desc: "Quiz 1 + Space Complexity + Intro to Binary Trees"
ready: false
pre-reading: "Savitch: 12.1, 10.1 - 10.3"
pdfurl: /lectures/CS24_Lecture4.pdf
annotatedready: false
annotatedpdfurl: /lectures/CS24_Lecture4_ann.pdf
handouturl: https://docs.google.com/document/d/1MoAQLZObtDIVmRpcJ84mAQ7HxswlxbyqK6ZBoqF_r0Y/edit?usp=sharing
---
# Code from lecture
[{{site.lect_repo}}/tree/main/{{page.num}}]({{site.lect_repo}}/tree/main/{{page.num}})


# Topics

## Space Complexity
The **space complexity** of an algorithm is the amount of **auxiliary (extra) memory** it uses as a function of the input size. Auxiliary space does **not** count the memory used by the input or the output — it only counts the additional memory the algorithm needs to compute the result. This includes:
- Local variables
- Temporary data structures (vectors, arrays, hash maps, etc.)
- Call stack frames from recursion

**Examples:**
- A function that sorts an array in-place using a single temp variable: **O(1)** space
- A function that copies all elements into a new vector to process them: **O(n)** space
- A recursive function with maximum recursion depth `d`: **O(d)** space (one stack frame per call on the deepest path)


* Efficient search using binary search
* Binary trees
* Binary search trees (BST) - search tree property and supported operations (search, insert, min, max)
* Visualizing BST operations: <https://visualgo.net/en/bst>
* Quiz 1


