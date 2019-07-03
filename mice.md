---
layout: page
title: Multiple imputation
---

## Current

Trying to figure out how much I can learn from https://rmisstastic.netlify.com/

## Intro

I've been thinking about multiple imputation. There are some fields where people routinely use multiple imputation when there is missing data, and I think this is based on a mis-apprehension.

The argument goes roughly like this:

* missing completely at random doesn't sound likely
* missing not at random isn't fixable
* therefore, my case is presumably the other thing

The problem is that "isn't fixable" ⇏ "unlikely".

## The problem

For now, let's imagine we have a linear model with a single response variable.

## Kinds of missingness

If missingness has nothing to do with anything we've measured about the data, we call it missing completely at random (MCAR)

If missingness has anything to do with the missing values themselves we call it missing not at random (MNAR)

The interesting case is the in-between case (usually confusingly called missing at random; I will call it MKAR, which is not confusing at all).

## Kinds of bias

Unless missing data are MCAR, missingness shifts the implicit _population_ that the study is observing. Let's call this relatively subtle effect “indirect bias”, and not worry about it here. 

I'm more worried about when either deletion or imputation can cause direct bias.

## Deletion

Deleting records is the most common way to deal with missingness. It can cause indirect bias for any kind of incomplete randomness. When can it cause direct bias?

If missingness is correlated with the outcome variable, then throwing out these cases will bias the outcome variable and thus the regression.

## Imputation

Good methods of imputation should be OK on any MKAR data, but should cause bias with MNAR data (since we expect the effect of the variable on its own missingness to bias the imputation)

## Hypotheses

* Deletion should be better than imputation when missingness is related to the missing variable

* Imputation should be better than deletion when missingness is related to the outcome variable

* In other cases, neither should be biased, but imputation _may_ do better by providing more information
