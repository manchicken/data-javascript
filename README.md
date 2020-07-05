# Data::JavaScript

Dump perl structures to JavaScript code.

`example.pl`:

```perl
use Data::JavaScript;

$hash = {'string' => 'Joseph',
         'array' => [qw(0 1 2 3 4 5 6 7 8 9 a b c d e f)],
         'capitals' => {'Sverige' => 'Stockholm',
                        'Norge' => 'Oslo',
                        'Danmark' => 'Koebenhavn'},
         'and' => [[0, 0], [0, 1]],
         'or' => [[0, 1], [1, 1]],
         'xor' => [[0, 1], [1, 0]]};
$hash->{'ref'} = $hash;

print scalar(jsdump("facts", $hash, 31.4e-1));
```

Output:

```js
var facts = new Array;
facts[0] = new Object;
facts[0].xor = new Array;
facts[0].xor[0] = new Array;
facts[0].xor[0][0] = 0;
facts[0].xor[0][1] = 1;
facts[0].xor[1] = new Array;
facts[0].xor[1][0] = 1;
facts[0].xor[1][1] = 0;
facts[0].or = new Array;
facts[0].or[0] = new Array;
facts[0].or[0][0] = 0;
facts[0].or[0][1] = 1;
facts[0].or[1] = new Array;
facts[0].or[1][0] = 1;
facts[0].or[1][1] = 1;
facts[0].capitals = new Object;
facts[0].capitals.Norge = 'Oslo';
facts[0].capitals.Sverige = 'Stockholm';
facts[0].capitals.Danmark = 'Koebenhavn';
facts[0].and = new Array;
facts[0].and[0] = new Array;
facts[0].and[0][0] = 0;
facts[0].and[0][1] = 0;
facts[0].and[1] = new Array;
facts[0].and[1][0] = 0;
facts[0].and[1][1] = 1;
facts[0].ref = facts[0];
facts[0].array = new Array;
facts[0].array[0] = 0;
facts[0].array[1] = 1;
facts[0].array[2] = 2;
facts[0].array[3] = 3;
facts[0].array[4] = 4;
facts[0].array[5] = 5;
facts[0].array[6] = 6;
facts[0].array[7] = 7;
facts[0].array[8] = 8;
facts[0].array[9] = 9;
facts[0].array[10] = 'a';
facts[0].array[11] = 'b';
facts[0].array[12] = 'c';
facts[0].array[13] = 'd';
facts[0].array[14] = 'e';
facts[0].array[15] = 'f';
facts[0].string = 'Joseph';
facts[1] = 3.14;
```
