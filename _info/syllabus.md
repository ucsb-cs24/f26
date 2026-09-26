---
title: "Syllabus"
layout: default
ready: true
---

# Syllabus <a name="syllabus"></a>

This document and linked resources are your **primary source** for understanding course expectations. Read it carefully and contact the instructor if you receive conflicting information from other sources.

**Instructor:** {{ site.instructor }} &nbsp; | &nbsp; **Office Hours:** {{ site.office_hours }} &nbsp; | &nbsp; **Lectures:** {{ site.lecture_times }}, {{ site.lecture_location }} &nbsp; | &nbsp; **Sections:** {{ site.lab_times }}, Phelps 3525

**Contacting Staff:** Ed (accessible from Canvas) is the **main communication channel** for this course — use it instead of emailing or messaging staff directly through Canvas. The instructor and TAs will be much more responsive on Ed. For private matters, send a private post on Ed to the instructor, or come to office hours.

**Lab/Section Attendance:** Optional but highly recommended. TAs and ULAs are available to help with assignments. Section switching is not permitted due to enrollment. Contact instructor after first lecture if you have a conflict.

### Course catalog description

Intermediate building blocks for solving problems using computers. Topics include intermediate object-oriented programming, data structures, object-oriented design, algorithms for manipulating these data structures and their run-time analyses. Data structures introduced include stacks, queues, lists, trees, and sets.

**Prerequisites:** CS24 builds on CS16. You should be comfortable with basic C++ (data types, control structures, functions, parameter passing), arrays, C-strings, structs, classes, number systems/memory, and recursion. Review CS16 materials or consult TAs if needed.

### Learning Outcomes
By the end of this course, students will be able to:
- **Explain** the C++ memory model, including stack vs. heap allocation and memory management.
- **Design and implement** abstract data types (e.g., lists, trees, graphs) using object-oriented principles.
- **Analyze** algorithm and data structure efficiency using asymptotic notation (Big-O, Big-Theta, Big-Omega).
- **Apply** appropriate data structures to solve computational problems efficiently.
- **Utilize** the C++ Standard Template Library (STL) effectively in program development.

### Resources

**Textbook:** *Data Structures and Other Objects Using C++* by Main & Savitch (primary text, also used in CS32). Additional references: [*Open Data Structures*](https://opendatastructures.org/) (Morin), [*Algorithms*](https://cseweb.ucsd.edu/~dasgupta/book/toc.pdf) (Dasgupta).

**Tools & References:** [VisuAlgo](https://visualgo.net/) (data structure visualizations), [C++ Reference](https://en.cppreference.com) (STL documentation), [GDB Cheat Sheet](https://darkdust.net/files/GDB%20Cheat%20Sheet.pdf) (debugging).

**Support:** Instructor office hours (see website), TA/ULA drop-in hours (Phelps 3525, times on course calendar).

**In-Class Participation:** Join the course on [iClicker Cloud]({{site.iclicker_join_link}}). Participation is ungraded but encouraged.

### Discussion Forum: Ed
Ed (accessible via the course site on Canvas) is the main communication channel for the course and should replace direct email or Canvas messaging for course questions — the instructor and TAs are much more responsive there. Post public questions when applicable; for coding issues:
- Share the smallest relevant code snippet (not screenshots/photos).
- Make posts private if including significant code.

### Grading
- **Programming Assignments**: 20% (labs + larger projects)
- **Practice (Leetcode + Caliber)**: 10% (preparation for quizzes and mock interview)
- **Quizzes**: 20% (4 quizzes during lecture, lowest quiz score replaced by final exam score if final score is higher)
- **Mock Interview**: 15%
- **Final Exam**: 35%

Grading follows standard scale.

### Quizzes (20%)
Quizzes are given during lecture to help you stay on track and assess your understanding of recent material.
- **Schedule**: Weeks 2 onward. See lecture schedule for quiz dates
- **Format**: 30 minutes, given at the beginning or end of lecture
- **Coverage**: Material from the previous 2-3 weeks
- **Grading**: Each quiz is worth 5%. 
- **Make-ups**: No make-ups for missed quizzes; use the provision of final exam replacing the lowest quiz scores
- **Content**: Mix of conceptual questions, code reading, and short coding problems

###  Practice (Leetcode + Caliber) (10%)
Complete 10 medium LeetCode problems from the assigned list to practice algorithmic problem-solving in preparation for quizzes and the mock interview.
- **Setup**: Create a LeetCode account (recommended format: `DS_[YourInitials]_[RandomNumber]`, e.g., `DS_JD_1234`).
- **Submission**: For each problem set (lp01-lp05), submit via Gradescope by the posted deadline:
  1. The direct link to your submission (e.g., `https://leetcode.com/problems/problem-name/submissions/123456/`), not the problem description page. To get the correct link: after solving a problem, go to your submission history, click on your submission, and copy the URL from your browser's address bar.
  2. A screenshot showing your test results. The screenshot must clearly show the problem name, your submission status, and how many test cases passed.
  3. Your complete code solution (copy-paste from LeetCode).
  4. A written reflection answering these questions (2-3 sentences each):
     - **Algorithm**: What algorithm/approach did you use? (e.g., "I used a sliding window with a hash map...")
     - **Data Structures**: Which data structures did you use and why?
     - **Complexity**: What is the time complexity and space complexity of your solution? Briefly explain why.
     - **Challenges**: What was the most difficult part? If your solution didn't pass all test cases, what cases failed and why do you think that happened?
  5. In general AI may not be used for generating the code or solution to Leet Code Problems.
- **Task**: Complete at least 2 problems from each of the 5 problem sets (lp01-lp05) for a total of 10 problems by Friday, Week 9, 11:59 PM.
- **Grading**: Each problem is worth 1%, awarded as follows:
  - **Full credit (1%)**: Solution passes all test cases + thoughtful reflection demonstrating understanding
  - **Partial credit (0.5%)**: Solution passes most test cases (>50%) + reflection shows genuine effort and understanding of approach
  - **No credit (0%)**: Incomplete submission, minimal effort, or reflection indicates lack of understanding
  - Submissions missing any required component (link, screenshot, or reflection) receive no credit
  - You must submit at least 10 complete submissions to receive any credit (e.g., 8 problems with full credit = 8%; 6 full + 4 partial = 8%; < 10 submitted = 0%)

  You will also receive other homework style formative feedback via the Caliber platform. 

### Mock Interview (15%)
Complete one 20-minute mock technical interview with a TA or ULA to demonstrate your problem-solving and communication skills.

**Timeline:**
- **Weeks 1-2**: Watch Ed for an announcement with booking instructions and the link to reserve your slot
- **By Friday of Week 3**: Book your slot
- **Weeks 3-10**: Complete your scheduled 20-minute mock interview

**Format:**
- Introduction & Behavioral (2 min) + Whiteboard Problem (5 min) + Coding (13 min) + Feedback (5 min)
- You'll plan and implement a solution to a medium-difficulty LeetCode problem while explaining your approach
- Evaluated on process and communication, not just correctness

**Important:**
- Book early! Slots fill up quickly
- No make-ups without prior arrangement. Missing your interview = 0%
- See [detailed guide and grading rubric]({{site.baseurl}}/info/mock_interview/) for complete information

### Late Policy
You have **five late days** total, with a **maximum of three days** per assignment, no penalty within this limit. Beyond this, instructor approval is needed and extensions may be given only for extenuating circumstances with documentation.

### Pair Programming
Some assignments allow optional pair programming (1-2 students coding together at one terminal, like a lab partnership). Benefits include:
- Industry relevance and employer value
- Improved collaboration skills (feedback from UCSB CS employers)
- Enhanced learning and grades (research-backed, positive student feedback)
- Watch: <http://bit.ly/pair-programming-video> (10 min)

For CS24 in particular, **please read each lab carefully to learn how pair programming will work for that lab**. Some labs may require you to work by yourself, others may require you to work with a partner, and still others may allow you to do either. In addition, some labs may allow you to work with a prior partner, while others may not. 
For all labs, you MUST
* add your partner on Gradescope when submitting your work EACH TIME you submit your file(s). After uploading your file(s) on Gradescope, there is a “Group Members” link at the bottom (or “Add Group Member” under “Groups”) where you can select the partner you are working with. Whoever uploaded the submission must make sure your partner is part of your Group. Click on “Group Members” -> “Add Member” and select your partner from the list.
* write both your and your partner's names and PERM numbers on each file submitted to Gradescope.


### Use of AI Tools
AI tools (e.g., ChatGPT, GitHub Copilot, Grok) can support learning but must not replace your effort. Usage rules:
- **Permitted Use**: Allowed only for assignments labeled “AI-permitted” in instructions; prohibited elsewhere (e.g., exams, unmarked tasks).
- **Constructive Engagement**: Use AI to:
  - Clarify concepts (e.g., “Explain binary search trees”)
  - Get code feedback (e.g., “Improve my queue implementation”)
  - Explore design trade-offs (e.g., “Hash table vs. array pros/cons”)
  - Use of AI for code completion on AI-permitted assignments, but you must explore original approach and be able to explain every single line of code.
- **Prohibited Use**: Generating full solutions, large code segments, or completing assignments (e.g., “Write a BST in C++”) is academic dishonesty, even when permitted. Debugging help is okay; rewriting your work is not. 
- **Tool Choice**: Any AI tool is allowed; identify it in your log.
- **Consequences**: Unauthorized use or misuse equals academic dishonesty (see below).

### Academic Integrity
Check each assignment’s collaboration policy—some are individual, others allow pair programming. Review UCSB’s Academic Integrity guidelines: <http://studentconduct.sa.ucsb.edu/academic-integrity>. Violations (e.g., cheating, plagiarism, unauthorized AI use) result in:
- **First Offense**: Zero on assignment + one-letter grade drop
- **Second Offense**: Course failure
- All cases reported to the Office of Student Conduct

Key rules:
- No unauthorized materials, study aids, or services (see AI policy).
- Cite all sources, including web searches, in assignments.
- Keep graded work private (no public posting; Git repos must be private).
- Don’t share solutions outside your pair/group.
- No exam info from prior takers or non-approved sources (e.g., Chegg).
- Pair programming requires joint coding, not split work; submit one version on Gradescope with partner names.

### Final Exam
The final exam is **comprehensive** and covers all course material.
- **Date**: {{ site.final_exam_date | date: "%A, %B %-d, %Y" }}
- **Time**: {{site.final_exam_time}}
- **Location**: {{site.lecture_location}} (Same as lecture hall)

**Exam Makeups**: Makeups are granted only for unavoidable emergencies (e.g., major illness), not scheduling conflicts. Check the exam date early and plan accordingly!

### Disabled Students Program (DSP)
UCSB accommodates students with disabilities via DSP (2120 Student Resource Building). Register early with documentation; accommodations are honored only through DSP. More info: <http://dsp.sa.ucsb.edu>.

### Disclaimer
Policies are accurate but may change at the instructor’s discretion within UC guidelines.

[Back to Syllabus](#syllabus){: data-ajax="false"}





