<?php

declare(strict_types=1);

namespace App\Service;

final readonly class TestService implements ServiceInterface
{
    public function doStuff(): string
    {
        return 'This is "test" env';
    }
}
