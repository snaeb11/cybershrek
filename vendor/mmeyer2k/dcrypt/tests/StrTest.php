<?php

declare(strict_types=1);

namespace Dcrypt\Tests;

use Dcrypt\Str;
use PHPUnit\Framework\TestCase;

class StrTest extends TestCase
{
    public function testEquals()
    {
        // Test with hash_equals
        $this->assertTrue(Str::equal('2222', '2222'));
        $this->assertFalse(Str::equal('2222', '3333'));

        // Test without hash_equals
        $this->assertTrue(Str::equal('2222', '2222'));
        $this->assertFalse(Str::equal('2222', '3333'));
    }

    public function testToken()
    {
        foreach (range(0, 100) as $i) {
            $token = Str::token($i);
            $this->assertEquals($i, strlen($token));
        }
    }
}
