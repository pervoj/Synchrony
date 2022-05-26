# Synchrony Contributing Guide

Thank you for your interest in Synchrony!

You can contribute in **five development segments**. Each of them is
**same important** as the others, and I am **very grateful for each of them**.

- **🐛 [Bug Reports](#-bug-reports)**
  – if you find a bug
- **✈️ [Feature Requests](#%EF%B8%8F-feature-requests)**
  – if you want a new feature
- **🌍 [Translations](#-translations)**
  – if your language is missing or inclomplete
- **💻 [Writing Code](#-writing-code)**
  – if you want to fix a bug, add a feature, just help with code or help
    with long-time maintanance and development
- **🎨 [Design](#-design)**
  – if you don't like something about the app design


## 🐛 Bug Reports

Bug reporting seems like a worthless little action. But in reality, it's
an **important contribution** that helps fix bugs and further improve the app.

So if you find a bug:

1. Go to **[this page](https://gitlab.gnome.org/pervoj/Synchrony/-/issues)**.
2. If you can and have time to do it, **check if the bug has already been reported**.
  - Some bugs might be already **fixed but not pushed to the main branch or released**.
3. **Report the bug with adequate issue template.** Also try to include few **screenshots**.


## ✈️ Feature Requests

Like bug reporting, feature requesting is a very **important contribution**
to understanding what users want.

So if you want a new feature:

1. Go to **[this page](https://gitlab.gnome.org/pervoj/Synchrony/-/issues)**.
2. If you can and have time to do it, **check if the feature has already been requested**.
  - Some features might be already **implemented but not pushed to the main branch or released**.
3. **Request the feature with adequate issue template.** Also try to explain **what it should do**, not how it should do it.


## 🌍 Translations

Since this app should help especially beginners with cloud syncing, it is
**very important** to give them a good experience in their native language.

But since this app is still under development and not released yet, there isn't
any reason to make translations now. When the app is released, I'll add a link
to GNOME Damned Lies or Transifex.


## 💻 Writing Code

Without the code, the application would not exist. So if you would like to help
with programming it, I would **really appreciate it**.

If you want to help me, you have two options:

- [just fix a bug or add a feature](#just-fix-a-bug-or-add-a-feature)
- [help with long-time maintanance and development](#help-with-long-time-maintanance-and-development)

### Just fix a bug or add a feature

1. So take a look at **[this page](https://github.com/pervoj/Synchrony/issues)**
   and **find some interesting bug report or feature request** for you.
2. Fork this repo.
3. Create a **new branch from the `dev` branch** with some descriptive name.
4. Do all the changes.
5. Create a [merge request](https://gitlab.gnome.org/pervoj/Synchrony/-/merge_requests)
   **back to the `dev` branch**.

> **⚠️ WARNING:** I won't merge any merge requests with the target branch set to
> other than `dev`, so make sure that you are creating your branch correctly.

### Help with long-time maintanance and development

Well, I'm really glad to see you in this chapter! I really appreciate everyone
who is interested in my work and wants to work with me!

So if you really have the courage, go to
[this page](https://gitlab.gnome.org/pervoj/Synchrony/-/issues) and create a new
issue with the adequate issue template. I'll review your request and give you
commit access to this repo.


## 🎨 Design

Every graphical interface needs to look good. Contribution in design is
therefore also **very important**.

The app GUI is built with GTK 4 and libadwaita and follows
the [GNOME Human Interface Guidelines](https://developer.gnome.org/hig/).

For mockups the app uses official
[GNOME templates](https://gitlab.gnome.org/Teams/Design/mockup-resources).
The mockups are made with Inkscape and stored in `design` directory.
The original mockup SVG is in `design/src` and the exported PNG directly in `design`.

If you want to change something in the app interface or mockups, you can
follow almost the same guide as in
the [Writing Code chapter](#just-fix-a-bug-or-add-a-feature).
