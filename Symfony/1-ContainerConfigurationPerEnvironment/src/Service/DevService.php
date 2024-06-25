<?php

declare(strict_types=1);

namespace App\Service;

final readonly class DevService implements ServiceInterface
{
    public function doStuff(): string
    {
        return 'This is "dev" env';
    }
}
