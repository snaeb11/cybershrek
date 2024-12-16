<?php

declare(strict_types=1);

/**
 * OpensslStatic.php.
 *
 * PHP version 7
 *
 * @category Dcrypt
 *
 * @author   Michael Meyer (mmeyer2k) <m.meyer2k@gmail.com>
 * @license  http://opensource.org/licenses/MIT The MIT License (MIT)
 *
 * @link     https://github.com/mmeyer2k/dcrypt
 */

namespace Dcrypt;

use Dcrypt\Exceptions\InvalidChecksumException;
use Exception;

/**
 * Static functions that handle encryption/decryption with openssl.
 *
 * @category Dcrypt
 *
 * @author   Michael Meyer (mmeyer2k) <m.meyer2k@gmail.com>
 * @license  http://opensource.org/licenses/MIT The MIT License (MIT)
 *
 * @link     https://github.com/mmeyer2k/dcrypt
 */
final class OpensslStatic extends OpensslWrapper
{
    /**
     * Decrypt raw data string.
     *
     * @param string $data   Data to be decrypted
     * @param string $key    Key material
     * @param string $cipher OpenSSL cipher name
     * @param string $algo   Hash algo name
     *
     * @throws Exception
     *
     * @return string
     */
    public static function decrypt(
        string $data,
        string $key,
        string $cipher,
        string $algo
    ): string {
        // Shift the IV off of the beginning of the ciphertext
        $ivr = Str::shift($data, parent::ivSize($cipher));

        // Shift off the checksum
        $sum = Str::shift($data, Str::hashSize($algo));

        // Shift off the AAD tag (if present)
        $tag = Str::shift($data, parent::tagLength($cipher));

        // Create a new key object
        $key = new OpensslKey($key, $algo, $cipher, $ivr);

        // Calculate checksum of message payload for verification
        $chk = $key->messageChecksum($data);

        // Compare given checksum against computed checksum
        if (!Str::equal($chk, $sum)) {
            throw new InvalidChecksumException();
        }

        // Decrypt message and return
        return parent::opensslDecrypt($data, $key, $tag);
    }

    /**
     * Encrypt raw string.
     *
     * @param string $data   Data to be encrypted
     * @param string $key    Key material
     * @param string $cipher OpenSSL cipher name
     * @param string $algo   Hash algo name
     *
     * @throws Exception
     *
     * @return string
     */
    public static function encrypt(
        string $data,
        string $key,
        string $cipher,
        string $algo
    ): string {
        // Generate IV of appropriate size
        $ivr = parent::ivGenerate($cipher);

        // Create key derivation object
        $key = new OpensslKey($key, $algo, $cipher, $ivr);

        // Create a variable for the authentication tag to be returned by reference
        $tag = '';

        // Encrypt the plaintext
        $msg = parent::opensslEncrypt($data, $key, $tag);

        // Generate the ciphertext checksum
        $chk = $key->messageChecksum($msg);

        // Return concatenation of iv + checksum + tag + ciphertext
        return $ivr . $chk . $tag . $msg;
    }
}
