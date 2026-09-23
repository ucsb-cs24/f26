---
title: "CS 24: Problem Solving with Computers-II , {{site.quarter}}"
---

### About CS24: Problem Solving with Computers-II

Welcome to CS24! The goal of this class is to solve problems efficiently using data structures and algorithms. You'll learn about abstract data types e.g. stacks, queues, priority_queues, sets, and maps; the concrete data structures used to implement them, e.g. vectors, and binary trees; and how to reason about the complexity of the operations performed on the data structures. Another goal is to become proficient with coding in C++ and using the C++ Standard Template Library (STL) to succeed in technical coding interviews and future classes!

<div style="text-align: center; margin: 30px 0;">
<img src="./image_2.jpg" alt="Data Structures Visualization from VisuAlgo" width="700" style="border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
<p style="font-style: italic; color: gray; margin-top: 10px;">Interactive data structure visualizations from <a href="https://visualgo.net/" target="_blank">VisuAlgo</a></p>
</div>

---

**Instructor:** {{site.instructor}} &nbsp; | &nbsp; **Office Hours:** {{site.office_hours}}

**Lectures:** {{site.lecture_times}}, {{site.lecture_location}} &nbsp; | &nbsp; 

---
**Sections:** {{site.lab_times}} in Phelps 3525 &nbsp; 
[Link to section slides]({{site.section_slides_url}})  &nbsp;  

---
**Graduate Student Researcher:** {{site.gsrs}}  &nbsp; 

**Teaching Assistants (TAs)** {{site.tas}}  &nbsp; 


**Learning Assistants (LAs):** {{site.ulas}}  &nbsp; 

---

### Required Textbooks

<table>
  <tbody>
    <tr>
      <td style="padding-right:2em"><strong>Savitch</strong></td>
      <td style="padding-right:2em"><em>Data Structures and Other Objects Using C++</em> by Main &amp; Savitch</td>
      <td>Primary textbook (also used in CS32)</td>
    </tr>
    <tr>
      <td style="padding-right:2em"><strong>OP</strong></td>
      <td style="padding-right:2em"><a href="https://opendatastructures.org/"><em>Open Data Structures</em></a> by Morin</td>
      <td>Free online; used for complexity and algorithmic topics</td>
    </tr>
  </tbody>
</table>

Pre-reading assignments in the lecture schedule use these shortforms (e.g., "Savitch: 10.1–10.3" or "OP: 1.3").

---

### Quizzes

There are **4 quizzes** given during lecture. The lowest quiz score will be replaced by the final exam score if the final score is higher.

{% capture quiz1_date %}{% include compute_lecture_date.liquid sequence=4 %}{% endcapture %}
{% assign quiz1_date = quiz1_date | strip %}
{% capture quiz2_date %}{% include compute_lecture_date.liquid sequence=8 %}{% endcapture %}
{% assign quiz2_date = quiz2_date | strip %}
{% capture quiz3_date %}{% include compute_lecture_date.liquid sequence=12 %}{% endcapture %}
{% assign quiz3_date = quiz3_date | strip %}
{% capture quiz4_date %}{% include compute_lecture_date.liquid sequence=17 %}{% endcapture %}
{% assign quiz4_date = quiz4_date | strip %}

| Quiz | Date |
|------|------|
| Quiz 1 | <time datetime="{{ quiz1_date }}">{{ quiz1_date | date: "%A, %B %-d, %Y" }}</time> |
| Quiz 2 | <time datetime="{{ quiz2_date }}">{{ quiz2_date | date: "%A, %B %-d, %Y" }}</time> |
| Quiz 3 | <time datetime="{{ quiz3_date }}">{{ quiz3_date | date: "%A, %B %-d, %Y" }}</time> |
| Quiz 4 | <time datetime="{{ quiz4_date }}">{{ quiz4_date | date: "%A, %B %-d, %Y" }}</time> |

Quizzes are 30 minutes at the beginning or end of lecture. No make-ups; see the [syllabus]({{site.baseurl}}/info/syllabus/) for full policy.

---

### Lectures

<div class="card card-body" id="lectures" markdown="1">
  {%include lecnot_table.html %}
</div>

### Lab Assignments

<div class="card card-body" id="lab" markdown="1">
  {% include lab_table.html %}
</div>

### Programming Projects

<div class="card card-body" id="pa" markdown="1">
  {% include pa_table.html %}
</div>

### Leetcode Practice Problems

<div class="card card-body" id="lp" markdown="1">
  {% include lp_table.html %}
</div>

### Office Hours

<style>
 iframe { width: 100%; height: 550px; }
</style>

<iframe src="https://calendar.google.com/calendar/embed?src=c_c7788493d2e424992c5a2393def31662bb2ccc39ccd03e51da61510f965f71e3%40group.calendar.google.com&ctz=America%2FLos_Angeles" style="border: 0" width="800" height="600" frameborder="0" scrolling="no"></iframe>

---

[CC BY-NC-SA 2.0](https://creativecommons.org/licenses/by-nc-sa/2.0/), Diba Mirza, {{site.quarter}}.
