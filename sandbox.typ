#import "./minienvs.typ": minienvs, envlabel
#show: minienvs

#set par(justify: true)

#let dist = math.upright("d")

= My heading

Hello World!

/ Definition (natural numbers):
  A metric space $(X, dist_X)$ is a set $X$ along with a metric $dist_X : X times X -> RR$ satisfying, for all $x, y, z in X$:

  1. *Positivity:* $dist_X (x, y) >= 0$, with $dist_X (x, y) = 0 <==> x = y$
  2. *Symmetry:* $dist_X (x, y) = dist_X (y, x)$
  3. *Triangle inequality:* $dist_X (x, z) <= dist_X (x, y) + dist_X (y, z)$

/ Example:
  Consider the set $RR$ with $dist_RR (x, y) = abs(x - y)$. $(RR, dist_RR)$ is a metric space:

  1. Positivity: $dist_RR (x, y) = abs(x - y) >= 0$; $abs(x - y) = 0 <==> x = y$
  2. Symmetry: $dist_RR (x, y) = abs(x - y) = abs(-(y - x)) = abs(y - x) = dist_RR (y, x)$
  3. Triangle inequality: $ dist_RR (x, z) = abs(x - z) = abs(x - z + y - y) = abs((x - y) - (z - y)) <= abs(x - y) + abs(z - y) = dist_RR (x, y) + dist_RR (y, z). $

/ Definition (Cauchy sequence):
  TODO

/ Theorem:
  foo

  bar

/ Theorem #envlabel(<theorem-a>):
  foo

/ Proof:
  asdf

/ Proof:
  foo bar

/ Proof (of @theorem-a):
  ...
