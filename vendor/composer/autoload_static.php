<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit8f53beeb5f22c6fdfccc7b34f5c440c9
{
    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'PHPMailer\\PHPMailer\\' => 20,
        ),
        'D' => 
        array (
            'Dcrypt\\' => 7,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'PHPMailer\\PHPMailer\\' => 
        array (
            0 => __DIR__ . '/..' . '/phpmailer/phpmailer/src',
        ),
        'Dcrypt\\' => 
        array (
            0 => __DIR__ . '/..' . '/mmeyer2k/dcrypt/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit8f53beeb5f22c6fdfccc7b34f5c440c9::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit8f53beeb5f22c6fdfccc7b34f5c440c9::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit8f53beeb5f22c6fdfccc7b34f5c440c9::$classMap;

        }, null, ClassLoader::class);
    }
}
