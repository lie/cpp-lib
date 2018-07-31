#ifndef _CRYPT_HPP_
#define _CRYPT_HPP_

#include "alllib.hpp"

namespace crypt {
	std::vector<unsigned char> sha256(unsigned char* plaintext, size_t len);
	std::vector<unsigned char> sha256(std::string plaintext);

	static const std::string base64_table = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
	std::string base64_encode(std::string plaintext);
	std::string base64_encode(std::vector<unsigned char> plaintext);
	std::string base64_encode_24bit(std::vector<unsigned char> plaintext);
	std::vector<unsigned char> base64_decode(std::string ciphertext);
	std::vector<unsigned char> base64_decode_4char(std::string ciphertext);

	std::vector<unsigned char> string_to_unsigned_char(std::string arg);
}

#endif /* _CRYPT_HPP_ */
