---
title: C# Interface vs. Class
redirect_from: "/archives/2009/03/c-interface-vs-class/"
tags:
- programming
---

_The original version of this post is lost to a deprecated blog of mine. I was able to retrieve an archive from [archive.org](https://archive.org). [You may find the archive of this post here.](
https://web.archive.org/web/20101121204212/http://www.jordansirwin.com/archives/2009/03/c-interface-vs-class)_

Originally posted: March 11, 2009

---


Recently, a colleague asked me what the difference between an interface and a class was. What was really being asked was 

>
“Why would you use an interface instead of a class?”
> 

After reassuring them that it wasn’t a stupid question (I’m willing to bet most developers have pondered this very question- I did), I went into a long explanation full of lousy examples and bad analogies. I think I was able to make a good case for using interfaces, but just to be sure I’ve decided to add more noise to the Internet.

If you're not familiar with the basics of an interface, I recommend a quick detour to [MSDN](http://msdn.microsoft.com/en-us/library/ms173156.aspx) for an overview. Maybe if you’re lucky, you’ll completely understand and won’t continue reading my attempt to explain them.

In a nutshell- an interface is a set of rules. It regulates its consumer by enforcing that certain methods, delegates, and/or events must be defined. Clear as mud, right? Let’s try an example, followed by a bad car analogy if you’re not so lucky.

{% highlight c# %}
    // Define an interface to "do something"
    interface IFooCanUseMeNow
    {
      void DoSomething();
    }

    // Foo will be our "service", it wants to "do interesting things"
    class Foo
    {
      public void DoSomethingInteresting(
        IFooCanUseMeNow classThatDoesSometing)
      {
        // use the interface to "do something"
        // it doesn't matter what the class really is,
        // it only matters that it implemented the
        // interface
        classThatDoesSometing.DoSomething();
      }
    }

    // Bar implements the interface, so therefore
    // Foo can "do something" with it
    class Bar : IFooCanUseMeNow
    {
      public void DoSomething()
      {
        // I have no idea what a bar can do, but do it anyways
      }
    }

    // Bartender implements the interface, so therefore
    // Foo can "do something" with it
    class Bartender : IFooCanUseMeNow
    {
      public void DoSomething()
      {
        // like serve a beer
      }
    }

    // Barber implements the interface, so therefore
    // Foo can "do something" with it
    class Barber : IFooCanUseMeNow
    {
      public void DoSomething()
      {
        // maybe cut some hair
      }
    }
{% endhighlight %}

In case the comments weren’t enough, let me explain this example in depth. The class, Foo, desires only one thing: “to do interesting things”. Its entire purpose in life is to perform “interesting things”, regardless of what they are, who they’re from, what side-effects they have, how to do them, etc… Foo simply doesn’t care about the details. This is accomplished via the interface IFooCanUseMeNow.

IFooCanUseMeNow has one rule: “in order to use me, you must implement a method called DoSomething that accepts no parameters and returns no values.” Pretty straight forward (I hope). Foo has a method called DoSomethingInteresting which accepts any object that implements IFooCanUseMeNow. Since all objects that implement IFooCanUseMeNow must (because of the rules) have a method called DoSomething, this means that Foo can invoke this method.

I’ve also declared several classes which implement IFooCanUseMeNow: Bar, Bartender, and Barber. Each one of these classes likely perform different tasks (come on, use your imagination!). The beauty of interfaces is that Foo doesn’t have to know anything about these classes to perform their actions. Because they follow the “rules” set by IFooCanUseMeNow, Foo can interact with them. Foo can now cut hair, serve beers, and… uhmm… sit around being board (hah, bad joke).

In case you’re completely lost, here’s a brief example of how these classes could interact:


{% highlight c# %}
    class ExampleOfUse_WithInterface
    {
      void Main()
      {
        // Create our interesting classes that do stuff
        Bar bar = new Bar();
        Bartender bartender = new Bartender();
        Barber barber = new Barber();

        // Create our Foo
        Foo foo = new Foo();

        // let Foo do interesting things
        foo.DoSomething(bar); // whatever a bar does
        foo.DoSomething(bartender); // serve beers
        foo.DoSomething(barber); // cut hair
      }
    }
{% endhighlight %}

Now the big question: “Why didn’t you just do this by inheriting a class?”. Here’s the exact same situation, but using an abstract class instead of an interface:


{% highlight c# %}
    class ExampleOfUse_WithClass
    {
      void Main()
      {
        // Create our interesting classes that do stuff
        Bar bar = new Bar();
        Bartender bartender = new Bartender();
        Barber barber = new Barber();

        // Create our Foo
        Foo foo = new Foo();

        // let Foo do interesting things
        foo.DoSomething(bar); // whatever a bar does
        foo.DoSomething(bartender); // serve beers
        foo.DoSomething(barber); // cut hair
        }
      }
    }

    abstract class FooCanUseMeNow
    {
      public virtual void DoSomething()
      {
        // abstract class does nothing
      }
    }

    class Foo
    {
      public void DoSomething(
        FooCanUseMeNow classThatDoesSometing)
      {
        // use the class to "do something"
        // it doesn't matter what the class really is,
        // it only matters that it inherited the
        // abstract class defined
        classThatDoesSometing.DoSomething();
      }
    }

    class Bar : FooCanUseMeNow
    {
      override public void DoSomething() { }
    }

    class Bartender : FooCanUseMeNow
    {
      override public void DoSomething() { }
    }

    class Barber : FooCanUseMeNow
    {
      override public void DoSomething()  { }
    }
{% endhighlight %}

As you can see, the code is very similar. The class version has a few more details (abstract, virtual, override), but it’s mostly the same code. The Main method that performs all of the work is actually exactly the same. So what’s the problem with using a class instead of an interface?

In such a simple example as this, the lines between a class and interface are a little blurry- they both work, with little reason to choose one over the other. But imagine a slightly more complicated example, where each of our “interesting classes” inherit from a base class:


{% highlight c# %}
    class Bar : CounterTop, IFooCanUseMeNow
    {
      public void DoSomething() { }
    }

    class Bartender : Person, IFooCanUseMeNow
    {
      public void DoSomething() { }
    }

    class Barber : Person, IFooCanUseMeNow
    {
      public void DoSomething() { }
    }

    abstract class CounterTop
    {
      // base for all types of counter tops
    }

    abstract class Person 
    {
      // base for all people
    }
{% endhighlight %}

In this example, it should be more apparent why using a class is not a good approach. Remember, C# allows as many interfaces as needed to be implemented but only allows one class to be inherited. With this more complex example, each of the “interesting classes” already inherit their base class, so they wouldn’t be able to inherit the FooCanUseMeNow class. Of course, you could have the low level abstract classes inherit FooCanUseMeNow, but that’s more or less hacking out a solution (just because Bartender and Barber can DoSomething, it doesn’t mean that some other Person can as well).

If you have understood everything thus far, then your imagination should be going wild with thoughts about past projects and examples of when you could have used interfaces. This example is just the tip of the iceberg. When fully understood, entire frameworks can be developed around interfaces- making them extensible and fluid. Nearly every problem can be solved with an interface, so I challenge you to try them out on your next one. I’m not suggesting that you go crazy here- I’m just suggesting that you find a way to use at least one interface to try it out. I think you’ll be satisfied with the outcome.

I hope the noise wasn’t too loud.

P.S. No car analogy comes to mind, so you’re getting off easy this time!