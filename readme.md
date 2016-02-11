Glubber
======
> Web-based static-site generator

Why?
--------

You're a developer. You love creating websites. You work with content-editors. They give you lots of text. You don't love copy/pasting content into your code. It's boring. It takes a while. Why can't you do your stuff while the content people do theirs?

So you use a CMS (probably WordPress). But you don't like CMS's in general. They have a lot of quirks to avoid and hoops you have to jump through. And furthermore, they are way slower than static sites. You like simple stuff. CMS's are not simple.

So you use a static-site generator. But then your content-editors are forced to learn some special formatting language to write their files in. They don't learn quickly. They don't even know markdown. They don't like it. They don't use it. You end up having to copy and paste again.

Your problems start getting to you. You start snapping at your coworkers. You stop taking showers. You try to forget your troubles by binge watching on Netflix. You start lying awake at night muttering. You begin to take \_Why's Poignant Guide seriously. You're in trouble.

Shouldn't there be a better way?

How does it work?
---------------------------

First install Glubber on the server.

Next, as a developer, make some templates. They should have placeholders for the actual content. Glubber can use Moustache, EJS, and several other templating languages.

The important step is to specify the variables in The Master File. Glubber will use the variables you specify (such as "Article Title", or "Written On") to create forms. If you want to be nice to the content people, add some helpful descriptions. These variables should match the variables in your templates. If they don't, you'll get errors.

Then the content editors log into the dashboard. They can see pages ready for them, based on the different files you have uploaded. When they click on a page, they are presented with a form, along with the helpful descriptions you wrote. They start writing.

When the content editors are done, they press the Big Green Button. This will tell Glubber to generate the site.

Glubber runs. The site gets generated. You're happy. The content people are happy. Birds are singing. Children are playing. Rainbows are glowing.

You have a simple, static-site. The content-editors have a process they can understand.

This is a better way.

**But wait!** The client doesn't like something! The design changes. The content changes. No problem! You do your thing and upload. The content people do their thing. When it's ready, regenerate the site. Ta da! (Return to rainbow scene.)

Why not just use Perch CMS?
---------------------------

Or maybe DocPad, or Jekyll, or WordPress, or whatever?

Glubber is a free, static-site generator, with a web-based backend for content-editors to work with. To my knowledge, no other CMS or platform fits that bill.

Glubber just special, I guess.
