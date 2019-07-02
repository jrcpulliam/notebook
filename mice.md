---
layout: page
title: Multiple imputation
---

I've been thinking about multiple imputation. There are some fields where people routinely use multiple imputation when there is missing data, and I think this is based on a mis-apprehension.

The argument goes roughly like this:

* missing completely at random doesn't sound likely
* missing not at random isn't fixable
* therefore, my case is presumably the other thing

The problem is that "isn't fixable" ⇏ "unlikely".

Multiple imputation attempts to guess missing values based on other information about the same record. When would that be good, bad or ugly?
