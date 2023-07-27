# JupyterLab accessibility usability test script

## Introduction

Hi, I’m [host name]. I‘ll be running this meeting today. This is [note taker name], they are here to take notes. 

Thank you for taking the time to participate in this study. A few things I want to remind you about before we start:

- This is completely voluntary. Please let me know at any point if you wish to stop participating.
- You can ask questions at any time.
- We are not testing you, we are testing how JupyterLab behaves when interacting with accessibility accommodations. There are no correct or incorrect answers.
- You signed a recording consent form before this session. Would you like me to go over what we are recording and where it will be stored as a reminder?
    - We will be recording the audio and visual of this call. Since I will be asking you to share your screen, that will include your screen for a part of the session. I will also be taking notes in a private document.
    - This recording and notes will be private and will only be shared with team members helping run these tests.
    - Feedback, problems we encounter, and other takeaways will be summarized and made public without identifying information. This will primarily take place on https://github.com/Quansight-Labs/JupyterLab-user-testing/, but the feedback may also be copied to appropriate places to make improvements like Jupyter Accessibility and JupyterLab repositories.

## Participant Introduction

First, I want to ask a few things about you. If we’ve met before, I’d still like to confirm whether or not things have changed.

- What operating system and browser are you using today? (We use this info to reproduce errors and support you if needed.) 
- What assistive tech (if any) are you using during this session? Are there any other settings that help you work on your computer, browser, or so on?
- Please tell me about the last time you used JupyterLab.

During this study, we will be exploring JupyterLab and a notebook that we’ve prepared for you. This notebook guides readers through the process of creating, saving, and loading a NumPy array with examples. I will be asking you to get familiar with JupyterLab, complete a part of the tutorial in the notebook, and answer follow up questions.
 
Throughout the session, please think out loud. Tell us if something unexpected happens, if something works well, if you think something could be improved, or if you’re confused. We do not expect all the tasks to be easy to complete with assistive tech and we invite you to complain!
 
Before we start, do you have any questions?

Please share your screen. If using a screen reader, can you set it so that you share the sound or share the text with a “speech viewer” ex: In NVDA you can set it to hold the NVDA button (insert or caps) and hit N and then you get options, go down to tools, and select speech viewer.

## Tasks

### Task 1 - Enter JupyterLab

Now I’d like you to open today’s notebook. I’ll tell you how to do this part. 

1. Open your web browser of choice
2. Paste this link into your browser: [Link to JupyterHub]
3. You should be at a page titled JupyterHub.
4. Please go to the Sign In area. Let me know when you are ready to enter the username and password.
5. From the home page, select Launch Server and wait for JupyterLab to load.

Please tell me when you’ve made it to JupyterLab.

Do you need to set up anything in JupyterLab so that it works better for you? Let’s do that first.

- [ ] Yes
- [ ] No

### Task 2 - Open files

Now that you’re in JupyterLab, I’m going to give an overview of what’s on the screen. By default, JupyterLab has a menu at the top, a main area where files and other content are opened, and side bars to the left and right. Depending what is opened, other features may appear. In this workspace, you will have access to a few example files as well as NumPy, Pandas, and Scipy

I’d like you to open two documents. First, open a notebook named [save-load-arrays.ipynb](https://numpy.org/numpy-tutorials/content/save-load-arrays.html). Second, open a Markdown file named **backup.md.** Please ask if you need more information.

- [ ] Yes. They opened both files.
- [ ] No. They opened one file.
- [ ] No. They opened no files.
- [ ] Something else:

Please navigate to the notebook you just opened—**save-load-arrays.ipynb**. Let me know how you get there and how you know you are in the right place.

- [ ] Yes. They successfully move to the notebook.
- [ ] No. They cannot successfully move to the notebook.
- [ ] Something else:

### Task 3 - Enter the notebook

What’s the title of this notebook?

- [ ] save-load-arrays.ipynb
- [ ] Saving and sharing your NumPy arrays
- [ ] Something else: 
- [ ] Can’t find

Below the title cell, please add a new cell. Here I’d like you to write today’s date and then run the cell. 

- [ ] Yes. They added a new cell, wrote the date, and ran the cell.
- [ ] No. They only completed part of the task.
- [ ] No. They could not complete any part of the task.
- [ ] Something else:

### Task 4 - Create and save an array

Now it’s time to follow some of the instructions in the notebook. Since this notebook contains a tutorial, I’ll be asking you to make a one-dimensional NumPy array as demonstrated in the following cells. Remember that I’m not judging what you know, I just want to see how JupyterLab works for you. Ask as many questions as you need.

First things first, please check that NumPy has been installed. You can run cell 1 under the heading **What you’ll need**. No output means it is successful.

- Host note: run `import numpy as np` to check.

- [ ] Yes. They identified the section and run the cell.
- [ ] No. They only completed part of the task.
- [ ] No. They could not identify or run the cell.
- [ ] Something else:

Please navigate to **Create Your Arrays**. Follow the instructions in this section to create an array.

- [ ] Yes. They created an array.
- [ ] No. They could not create an array.
- [ ] Something else:

Continuing with the tutorial, I’d like you to save the array you just created as a CSV file. Please navigate to **Save the data to csv file using savetxt** and follow the instructions in the section.

- [ ] Yes. They could save the the array as a CSV.
- [ ] No. They could not save the array.
- [ ] Something else:

I’d like to check if the CSV file you created has been properly saved. Please navigate to the file browser and let me know if you can find it.

- [ ] Yes. They found the CSV file.
- [ ] No. They did not find the CSV file.
- [ ] Something else:

Task 5 - Load and manipulate data

Next, I’d like you to navigate to the bottom of the notebook. We’ll be breaking from the rest of the tutorial here.

Please load **x_y-squared.csv** with pandas so we can explore it as a dataframe. You can do this by running:

```
import pandas as pd
pd.read_csv("x_y-squared.csv")
```

Can you tell if the dataframe appeared or if what you ran had another output? Please tell me how you know. 

- [ ] Yes. They loaded the array and found an output.
- [ ] No. They only completed one of the tasks.
- [ ] No. They did not load the array or find an output.
- [ ] Something else:

Please read me the columns in the dataframe.

- [ ] #x, y
- [ ] Reads some but not all.
- [ ] Cannot read the dataframe columns.

If you needed to explore this data, how would you approach it? What steps or tools would you use? If you would do this somewhere besides JupyterLab, that’s helpful to know as well.

If you needed to explain an interesting finding in a data set like this for someone else, how would you represent the data? Like before, what steps or tools would you use? It does not have to be in JupyterLab.

### Task 6 - Adjust visual settings

While we’re talking about sharing the information in this notebook, please put the notebook in Presentation Mode.

- Host note: This can be found under View > Presentation Mode or in the Command Palette.

- [ ] Yes. They found and activated Presentation Mode.
- [ ] No. They did not find or activate Presentation Mode.
- [ ] Something else:

Presentation Mode only makes visual changes to the documents you have open. I’d also like you to increase the UI font size.

- Host note: This can be found under View > Increase UI Font Size

- [ ] Yes. They found and activated Increase UI Font Size.
- [ ] No. They did not find or activate Increase UI Font Size.
- [ ] Something else:

Increase UI Font Size doesn’t tell you how much you are increasing the font size each time. Can you find if there is another way to adjust the UI font size via JupyterLab’s settings? Please explore.

- Host note: UI font size does not appear in the settings, the goal is to ask participants to explore their options.

- [ ] Yes. They could entirely explore the settings and found no other font size options.
- [ ] No. They could not entirely explore the settings.
- [ ] Something else:

There isn’t currently another way to adjust JupyterLab’s font size. I wanted to give you a chance to navigate the settings and see what you find. I don’t have any other exploratory questions like this.

Please log out of this JupyterLab. You can close the tab once you are logged out.

- Host note: This can be found under File > Log Out or in the Command Palette.

- [ ] Yes. They could log out.
- [ ] No. They could not log out.
- [ ] Something else:

### Task 7 (optional) - Participant’s JupyterLab

Now that I’ve gotten a sense of how you can interact with this version of JupyterLab, please tell me about how you interact with JupyterLab in your work. If you can show me around the JupyterLab you have locally, that would be helpful too.

## Follow Up Questions

Now that you’ve explored JupyterLab, I’d like to ask you to reflect on how that experience went and any other feedback you might have.

**If we have future user feedback sessions like these, would you be interested in participating again? May we keep your contact info for that purpose?**
 
**Let’s talk about what went wrong in JupyterLab. What was frustrating about completing the tasks today?**
 
**Is there any information, options, or capability that you found missing?**

**Tell be about what went right in JupyterLab. What worked as you expected or better?**
 
**Do you have any other impressions or feedback that you would like to share?**

**Do you have any questions for me?**

Thank you so much for participating!

---

## Interview Debrief

After each test, take a few minutes to perform a debrief while the session is fresh in your mind. This ensures that key learnings and observations are not lost in the scramble of many interviews or long timelines.

**What are our action items based on this feedback?**

**Any more details on issues we already discovered?**

**Are there any new questions I should explore in a further script?**

**What are some key quotes that I heard?**
