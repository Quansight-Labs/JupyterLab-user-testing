# Results: JupyterLab Accessibility Overview

These results are from user interviews conducted in May 2023 with [this test script]() on [a modified version of NumPy Tutorials’ Saving and sharing your NumPy arrays notebook](https://github.com/Quansight-Labs/JupyterLab-user-testing/blob/main/notebooks/save-load-arrays.ipynb). 

This work was funded by a [Chan Zuckerberg Initiative Essential Open Source Software for Science grant](https://chanzuckerberg.com/eoss/proposals/inclusive-and-accessible-scientific-computing-in-the-jupyter-ecosystem/). The [full grant proposal can be found on the jupyter/accessibility repository](https://github.com/jupyter/accessibility/blob/da6db43da092255c205ce1603d0d10b1f51c131b/docs/funding/Inclusive_and_Accessible_Scientific_Computing_in_Jupyter_Ecosystem_SUBMITTED_PROPOSAL.pdf).

## What was tested

**Operating systems:** iOS, Mac OS Monterey, Windows 10, Windows 11

**Browsers:** Chrome, Firefox, Opera GX, Safari

**Assistive tech:** Built-in large cursor and pointer operating system settings, customized operating system shortcuts, Dragon Professional (speech recognition software), in-browser contrast adjustments, in-browser focus styling adjustments, Mac OS Zoom (built-in screen magnifier), mobile device, split keyboard, [sticky keys](https://en.wikipedia.org/wiki/Sticky_keys)

**Interface:** Participant browser and [preset environment in The Littlest JupyterHub](https://github.com/Quansight-Labs/JupyterLab-user-testing#jupyterlab-user-testing-environment) running JupyterLab 3.6.1. 

**Sample size:** 7 participants

**Method:** Combination of qualitative [usability testing](https://www.nngroup.com/articles/usability-testing-101/) and [user interviews](https://www.nngroup.com/articles/user-interviews/)

**Team:** [Isabela Presedo-Floyd](https://github.com/isabela-pf), [Tania Allard](https://github.com/trallard/), [Stephannie Jimenez Gacha](https://github.com/steff456), and [Gabriel Fouasnon](https://github.com/gabalafou/) via [Quansight Labs](https://labs.quansight.org/)

## Limits

While this study provides insights into how JupyterLab may function for users of assistive technology, it is important to explicitly note limits and gaps in this specific study.

- **We worked with a small sample size of seven participants.** These participants joined as a part of an open call, so they are self-selected. Facilitators did select from within the larger group to make sure participants had used Jupyter tools before and were in a region where we could send payment.
- **None of the participants used a screen reader.** Screen readers are a prominent group of assistive tech and critical to test with, so an ideal sample would absolutely include them. Of the assistive tech used by participants in this study, none of them present notebook content back to their users in a strictly non-visual way. For example, a screen magnifier user does interact with the notebook very differently than someone working without magnification. But both screen magnifier users and default magnification users are using their vision to read what is on the screen; they are able to directly interact with visual information. A screen reader user would have that content interpreted by the screen reader and read to them; they are interacting with an interpretation of visual information which is often where major issues arise.
- **This study is not an attempt to determine JupyterLab’s compliance with any single accessibility standard.** These results are not an accessibility statement for JupyterLab, JupyterHub, or any related Jupyter projects.

## Findings

This section summarizes issues, participant feedback and other patterns that appeared throughout test sessions. Findings are split between Navigation, UI customization, and Notebook concerns.

### Navigation

- **The menu bar (File, Edit, and so on) was the most used [JupyterLab region](https://jupyterlab.readthedocs.io/en/latest/user/interface.html) other than working in the notebook.** It was also most participants’ first choice to search when a task was unfamiliar to them. The left sidebar was used second most. The notebook toolbar was used third most. No participants used the cell toolbar or status bar. No tasks required features that are by default in the right sidebar, so it should not be counted.
- **JupyterLab’s default focus styling needs to be improved.** Based only on the sessions, no regions appear have a designated [focus state](https://www.w3.org/WAI/WCAG22/Understanding/focus-visible.html). Some regions (like the file browser) have hover states that can be triggered by the keyboard and functionally tell users where their keyboard focus is. This is blatantly inaccessible because it prevents keyboard users from being able to tell where they are at JupyterLab at any given moment.
- Many participants had to work to find things within the notebook (cells, headings, and outputs were requested throughout the test). They often navigated past their goal and had to start again. They rarely used features JupyterLab has to support navigating notebooks, like the [table of contents](https://jupyterlab.readthedocs.io/en/latest/user/toc.html) or [find](https://jupyterlab.readthedocs.io/en/latest/user/interface.html#searching) features. Only one participant used the table of contents; this participant explicitly praised it.
- **Allowing the browser to take precedence wherever possible matters.** Multiple participants had browser-level settings, like high contrast settings or customized focus indicators, to improve their experience on all web pages. Participants with browser-level settings wanted them to carry over to JupyterLab. No major issues of JupyterLab overriding these settings occurred during these sessions, but participants made a point to call out the importance and their relief that they could use the settings they needed during their session.

### UI customization

- **Participants cared about themes.** Of participants who immediately changed settings to make JupyterLab better for their needs, all but one took the time to change the theme. Participants who were not aware JupyterLab had multiple default themes and found out later in the session remarked positively.
- **Adjusting all text’s font size and having JupyterLab subsequently reflow its content was highly desired.** This is beyond default JupyterLab’s current text adjustment capabilities, but it does mean that the font size settings we have now are on the right track. 
- **[Low color contrast](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html) was not a major blocker for participants to complete tasks, but it was unpleasant.** Some participants overwrote sections of JupyterLab’s default colors with their browser to remedy it, but that is specialized knowledge not available to all possible users. The biggest issues arose when reading code; the syntax highlighting had particularly poor contrast or color combinations that were not distinct to participants.

### Notebook

- **Notebook structure and content does impact participant experience.** This means authors have the power to make working in JupyterLab more accessible even before changes can be made to JupyterLab itself. For our sessions, we received positive feedback on the [NumPy Tutorial notebook](https://numpy.org/numpy-tutorials/content/save-load-arrays.html)). Kudos to the NumPy Tutorials and wider documentation team!
- **This study did not test a long or mixed content notebook.** Participants mentioned that there was nothing in this notebook they were wholesale not able to access, though the default styling sometimes made it harder to read. We did not test a notebook with images, plots, or other interactive notebook outputs, [which in other notebook interfaces have proven difficult](https://github.com/Iota-School/notebooks-for-all/blob/main/user-tests/2-content/results.md#images).
- **Markdown headings were indispensable in keeping participants and facilitators in the same place.**
- **The width of a document, notebook or otherwise, and length of code lines impacts magnification users.** Wider or longer sections require more horizontal movement. This is taxing and increases the likelihood of missing information. 
- A majority of participants were more familiar with different notebook interfaces than JupyterLab. **The notebook file was the common ground for all.** Participants expected the notebook to behave the same regardless of interface.

## Comparing assistive tech and non-assistive tech experiences

Because we had participants who were using assistive tech and participants were not using assistive tech, we were able to observe some of the user experience differences between the two groups. Many of these comparisons highlight some of the disparities and impacts of having an inaccessible interface.

It is important to note that in this series of tests those using assistive tech and those not using assistive tech did have similar rates of success for tasks when averaged per test session. Differences arose for how participants managed to complete tasks, the ease at which they expressed completing tasks, and the time it took them to complete tasks. 

How participants completed tasks varied too widely to summarize here, but it was key that they have a variety of methods available to complete a task. Not all participants could use the same features even if they were equally aware of them. Having multiple paths to successfully complete a single task can be positive. 

The ease with which participants reported feeling at completing tasks was roughly split; this does not account for variations in familiarity with JupyterLab, a metric we did not quantitatively collect. Participants not using assistive tech more frequently expressed all positive sentiments about the ease of a task. “Intuitive” and “easy to learn” were phrases that came up repeatedly. Participants using assistive tech still did express positive sentiments, but they gave more mixed positive and negative feedback. Many times the negative feedback was hedged with their report of a workaround that they knew they could fall back on if needed, but that completing tasks “might not be possible” or “takes a long time” and can be “tiring” is telling. Even when they were completing tasks they weren’t familiar with, this kind of language simply did not come up with participants who did not use assistive tech during their session.

As for the time it took to complete tasks, those using assistive tech during a session took roughly twice as long to complete tasks as those not using assistive tech. Multiple factors could contribute to a participant using assistive tech needing longer to complete the task. Some are less directly JupyterLab’s doing: 
- Keyboard navigation frequently requires more interactions than mouse navigation.
- Screen magnifiers show less on a screen at a time and frequently require more interactions to see equivalent areas as a result.
- The delay for dictating navigation may be longer than the delay for thinking before moving a mouse. 

While these are not exclusively JupyterLab problems, JupyterLab still can provide better support. But JupyterLab also slowed assistive tech users down with 
- Weak navigation support for the large number of distinct regions in the interface
- Difficult to read controls (most frequently small and/or low contrast areas like cell prompts or syntax highlighting)
- [keyboard traps](https://www.w3.org/WAI/WCAG21/Understanding/no-keyboard-trap.html)
- Poor or no visible focus states
- Unclear settings (participants remarked upon a lack of feedback when changing font sizes)
- Limited responsiveness/poor interactions with browser zoom settings.

Finally, as navigation becomes more difficult or requires more interactions—as is often the case between mouse and keyboard navigation users—JupyterLab keyboard shortcuts or browser keybindings become important and participants expect them to have full support. In the Jupyter software contributor community, we often refer to these features as the domain of so-called “advanced” or “power users.” It is important to remember that keyboard navigation can be used by JupyterLab users of all experiences and is equally indispensable for all.

## Opportunities for improvement

Gaining insight on what caused participants to struggle or be unable to complete tasks also revealed places that JupyterLab might better support them. These opportunities can be split into documentation and JupyterLab experience changes.

### Documentation

Participants craved information. Whether they had a need to compare the testing environment JuptyerLab to their everyday working environment, mis- or trouble remembering how to complete a task, questions about how to complete a task in JupyterLab, or explicit requests for documentation, requests happened at least once per test. Repeated requests may be supported by:

- **Increasing keyboard shortcut discoverability in the JupyterLab interface and in its documentation.** While keyboard shortcuts do appear in relevant tool tips and have [a page on the JupyterLab documentation](https://jupyterlab.readthedocs.io/en/latest/user/interface.html#keyboard-shortcuts), participants frequently could not find the ones they needed. This had a greater negative impact on keyboard navigating participants who must spend greater amounts of time navigating without shortcuts.
- **Including the [command palette](https://jupyterlab.readthedocs.io/en/latest/user/commands.html#command-palette) in user-facing accessibility documentation.** The command palette is not explicitly an accessibility feature (and at time of writing has known accessibility issues), but it proved a helpful feature for some participants. Several participants were unaware of the command palette and could have benefited from it. Participants used it to 
     - search features and actions they could take (ie. it became a first round of documentation when they didn’t know how to complete the task)
     - to refer to keyboard shortcuts
     - to complete actions with less keystrokes than other routes (ie. it takes less strokes to navigate via keyboard from an open notebook to a shortcut-opened command palette than it does to move tab by tab from an open notebook to the menu bar)
     - and to informally navigate large areas of JupyterLab (ie. participants knew where in JupyterLab they wanted to go and would select a command from the command palette solely because they knew would move their focus closer to the desired area)
- **Drawing attention to UI customization options in user-facing accessibility documentation.** Font size adjustments (UI Font Size, Editor Font Size, etc.), default themes, UI modes (Simple Mode, Presentation Mode, etc.). Participants were almost entirely unaware of these features, and a majority of them reacted positively when they discovered or were told to use them during a task. 

### JupyterLab experience changes

Based on direct feedback from participants and observed behavior, we’ve found multiple impactful ways to adjust JupyterLab’s user experience with the needs of disabled users as a priority. With the high-level tasks completed during these sessions, problems encountered and specific solutions will be similarly high level. Ironing out experience and implementation details is outside the scope of this work, but is necessary in the future. Overall, JupyterLab’s user experience would benefit from:

#### Improved keyboard navigation support 

Coarse grain (moving between large JupyterLab sections like the main document area, menu bar, side bars, etc.) navigation needs much more attention. Within keyboard navigation, the following subsets stood out.

- **The table of contents is useful for navigating notebooks, but only one participant was aware and used it.** Participants who did not use the table of contents generally took more time to find cells within a notebook and often moved past their desired goal by accident. This brings the discoverability of such a useful feature into question.
- **The command palette was one of the more popular choices for navigating through large areas of JuptyerLab in addition to completing actions within the notebook.** Because the command palette is not currently designed with navigation in mind, this proved a hit-or-miss solution. Explicitly adding commands to move keyboard focus to major JupyterLab regions or specific features could provide discoverable and effective keyboard navigation on the highest level. The ability to call the command palette with a keyboard shortcut while doing any other task in JupyterLab was praised. 
- **Having an interface exclusively for coarse grain navigation.** While navigation may still be improved within other areas of JupyterLab (like the command palette recommendation above), navigation is critical enough to warrant its own attention. Adding a central location to change keyboard focus between the menu bar, main document area, status bar, both side bars, and possibly Settings would remove the most major keyboard navigation issues that appeared in this series of tests. In past versions of JupyterLab, this idea has been touched upon with the skiplink—a prompt that allows users to move focus immediately to the main document area if they begin tabbing from the start of JupyterLab. 

#### More UI customization 

This includes the discoverability of existing UI customization features and the addition of more, or more detailed, customization options. It is important to note that UI customization is most likely to support disabled users who still have some amount of vision available to them which was the case with this test’s participants.

- **JupyterLab does have existing UI customization features by default.** Light versus dark themes, editor font size, and layout modes (Simple Mode, Presentation Mode) all give users choices to set up JupyterLab in a way that may work better for them. Because getting to these features requires users to navigate multiple areas of JupyterLab, and they do not require any domain-specific knowledge, the test script asked participants to engage with some of these features. The overwhelming response was one of positive surprise. Participants wanted to use these features and did not know they existed. Light/dark themes were the most likely to be known, while font size adjustments weren’t known by any participant. Screen magnifier users and other low-vision participants emphasized how helpful font size adjustment would be for them and that they wished they knew about them before.
- **JupyterLab’s default—meaning without the addition of extensions—UI customization capabilities are limited.** In conversation with participants and in observing the issues they faced, we’ve determined additional UI customization features that would help them better use JupyterLab. Entirely new customization options include selecting from multiple syntax highlighting themes, being able to select major button colors (like the `--jp-brand-color` family), being able to select state colors (like the warning, error, and info color families), and to set a maximum width for documents in the main document area. Additions to existing customization options include more themes beyond light and dark modes, to be able to change all text sizes in JupyterLab, to be able to select text sizes directly rather than in opaque increments (ie. to set font sizes to a point, pixel, or percent value rather than selecting menu items with no feedback), and to assign other or additional indicators for the status of running or freshly completed code cells.

#### Different options for feedback on cell status 

**Current default JupyterLab feedback for notebook cell status is exclusively visual.** The cell prompt and favicon changes rely on users being able to see the icons, especially since these changes are not surfaced to the user unless their focus happens to already be on those icons when they change. This makes knowing the status of a cell difficult to impossible for users who cannot look at the screen in full. Quick to run code cells with a cell output—like the majority of cells run during these tests— tend to make this a trivial issue, it marks a drastic experience difference for sighted and non-sighted users. Fully sighted users can quickly verify the status of a cell in two different places, go about other work while waiting, and more easily verify when a cell has completed running. 

Participants who could not easily see or could not see the staus indicators at all (since they are small and relatively low contrast) relied on prior experience with notebooks, gut instinct about how long that section of code usually takes to run, or the appearance of a cell output to check a cell’s status. Having at least one non-visual option (like an audio indicator) or a visual option that would represent itself in a timely manner for assistive tech (like a notification) could provide users with the support they want. Making these options customizable would be important as well.

#### Flexible command palette search/filter behavior

Because several participants relied heavily on the command palette to complete tasks, the limit of its filtering arose several times. From the user end, the command palette feels like it searches only for direct matches within the command list for whatever the user types in. If a user knows exactly what they are looking for, they often have success. Participants were sometimes able to quickly and flawlessly locate a desired command. But when they were exploring JupyterLab’s command options, unable to remember the exact name of a command, made a typo, or were unfamiliar with a task many participants had to give up using the command palette in order to complete the task. Depending on the assistive tech they use, typos can also be nontrivial to detect for blind or visually impaired users. Having a fuzzy search or other typo/error support rather than only the direct filter would help the command palette continue to be the boon many participants wanted it to be.

## For future tests

Reflecting on the findings and gaps in this set of tests, the following are questions to revisit in the future.

- How might a screen reader user complete common notebook tasks in JupyterLab?
- What are JupyterLab’s strengths and weaknesses when it comes to authoring notebooks and other documents with assistive tech?
- What more can we learn about navigating JupyterLab, especially with a variety of assistive tech? What are good examples of navigation that support disabled users?
- What are the full range of notebook cell output types and what feedback to disabled users have on each type?
- What is the real time collaboration experience in JupyterLab like for assistive tech users? This question requires JupyterLab collaboration modes to be more stable before it can be tested.

As mentioned in the Limits section, the sample we were able to test with for these sessions was not as comprehensive of varied disabilities and assistive tech as we would like. Recruitment for these sessions was done within existing JupyterLab community spaces and was mostly self-selected; future tests would likely benefit from a more selective sample and outreach to disability communities where appropriate. This should be done with careful consideration as the history of people who make products interrupting disability communities and asking for labor is a fraught one.

A usability testing style script was chosen for this testing session because of the need for scoped and actionable accessibility feedback in JupyterLab, project timeline, available team, and other logistical constraints. After these results, we can recommend that observational/[field studies](https://www.nngroup.com/articles/field-studies/) would be useful in understanding the broader, holistic accessibility issues within JupyterLab’s user experience that a study like this is not suited to survey.
