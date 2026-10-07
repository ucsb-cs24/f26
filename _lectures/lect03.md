---
num: "lect03"
sequence: 3
desc: "Complexity Analysis"
ready: true
pre-reading: "OP: 1.3, Dasgupta: 0.1 - 0.3"
pdfurl: /lectures/CS24_Lecture3.pdf
annotatedpdfurl: /lectures/CS24_Lecture3_ann.pdf
annotatedready: true
handouturl: https://docs.google.com/document/d/1MoAQLZObtDIVmRpcJ84mAQ7HxswlxbyqK6ZBoqF_r0Y/edit?usp=sharing
handoutready: false
---
# Code from lecture
[{{site.lect_repo}}/tree/main/{{page.num}}]({{site.lect_repo}}/tree/main/{{page.num}})


# Lecture prereading
* OP (Open data structures book), chapter 1.3: <https://opendatastructures.org/ods-cpp/1_3_Mathematical_Background.html>
* DG (Algorithms by Das Gupta): chapter 0.1 - 0.3 <http://algorithmics.lsi.upc.edu/docs/Dasgupta-Papadimitriou-Vazirani.pdf >

# Topics
* Discuss and motivate runtime analysis
* Model of computation (constant time operations)
* Big O notation and using Big O for running time analysis.

# Key Definitions

## Time Complexity
The **time complexity** of an algorithm is the number of **constant-time operations** it performs as a function of the input size. We express this using Big-O notation, which captures the growth rate and ignores constant factors and lower-order terms.

**Examples:**
- A single loop over an array of size n: **O(n)** time
- A nested loop (loop inside a loop) over an array of size n: **O(n²)** time
- Binary search on a sorted array of size n: **O(log n)** time


## Space Complexity
The **space complexity** of an algorithm is the amount of **auxiliary (extra) memory** it uses as a function of the input size. Auxiliary space does **not** count the memory used by the input or the output — it only counts the additional memory the algorithm needs to compute the result. This includes:
- Local variables
- Temporary data structures (vectors, arrays, hash maps, etc.)
- Call stack frames from recursion

**Examples:**
- A function that sorts an array in-place using a single temp variable: **O(1)** space
- A function that copies all elements into a new vector to process them: **O(n)** space
- A recursive function with maximum recursion depth `d`: **O(d)** space (one stack frame per call on the deepest path)