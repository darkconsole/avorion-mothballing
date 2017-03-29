# Avorion Mothballing

![Avorion Version](https://img.shields.io/badge/avorion-0.11.0.7844-red.svg)

> ***/ˈmôTHˌbôl/***
>
> stop using (a piece of equipment or a building) but keep it in good condition so that it can readily be used again.

So you built this amazing ship but it requires so much crew that it is costing
you more money than you can make. After spending all that time parking it
abandoned in the middle of nowhere, or destroying it completely, is such a waste
and if it served you well IT DESERVES BETTER THAN THAT.

With this mod you can mothball ships in your home sector, allowing you to remove
as much of the crew as you need. Normally, if you have less than 100% of the
mechanics a ship needs, it will slowly lose health until it dies. With this mod
you can pull all your crew except say, 25% of your mechanics, and your ship will
never fall below 25% health.

So now you can keep a skeleton crew to keep it alive, and have a bunch of cool
shit parked around your home sector that you actually get to see.

# Install

This mod needs to be on both the client and the server UNLESS the player has
no intention to ever use it, then the client side can be skipped.

Copy the data directory to your game or use the patches. This mod overwrites
nothing.

# Usage

To put the ship you are currently controlling into mothballs use the chat
command `/mothballs on` - a moment later the message will appear. If not you
probably didn't install it client side...

![Durr](http://i.imgur.com/mljC7Ky.png)

To take a ship out of mothballs use the chat command `/mothballs off`

![Durr](http://i.imgur.com/I2lBOll.png)

While a ship is mothballed you must have at least 25% mechanic workforce. If you
do not have 25% or more, then nothing will happen and the ship will still blow
itself up eventually.

![Durr](http://i.imgur.com/4zG9ZcS.jpg)

Whatever percentage of mechanic workforce you have, that is how far down the
health of the ship will be allowed to go. If you have 33% workforce, then the
ship will stablize at 33% health.

# Configuration

You can tweak some configuration values to adjust how the mod works. They are
located in the `lib/dcc-mothballs/mothballed.lua` script.

## HealMult (Float = 1.0)

By default the ship heals the exact amount of damage it takes. Values greater
than one will allow the ship to heal more damage than it takes to keep it fully
healed. Values less than one will extend the amount of time you have before a
ship blows itself up.

## BindToMechanics (Bool = true)

The ship will only heal itself when its health percentage falls below the
mechanic percentage. So if you leave 25% of the mechanics on, it will never
fall below 25%. Turning this off the ship will stay at the health it was
mothballed at (assuming HealMult = 1).

## MinMechanics (Float = 25.0)

The minimum mechanic workforce that must be on the ship for mothballing to work.
Set this to 0 to disable. Set this to 50 if you want to require they have 50%
of the normal workforce as a minimum.

## Debug (Bool = false)

Spam the console with debugging info.

# TODO

Features I plan to add in the future.

* Prevent the ship engine/thrusters from working while mothballed.
* Disallow Captains on-board.
