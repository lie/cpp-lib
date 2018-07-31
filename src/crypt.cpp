/*
 *  crypt: 暗号関連
 */

#include <openssl/sha.h>
#include "alllib.hpp"
#include "crypt.hpp"

namespace crypt {

std::vector<unsigned char> sha256(unsigned char* plaintext, size_t len) {
	std::vector<unsigned char> ret(SHA256_DIGEST_LENGTH);
	unsigned char ciphertext[SHA256_DIGEST_LENGTH];
	SHA256_CTX c;

	SHA256_Init(&c);
	SHA256_Update(&c, plaintext, len);
	SHA256_Final(ciphertext, &c);

	for(int i = 0; i < SHA256_DIGEST_LENGTH; ++i) {
		ret[i] = ciphertext[i];
	}

	return ret;
}

std::vector<unsigned char> sha256(std::string plaintext) {
	std::vector<unsigned char> ret(SHA256_DIGEST_LENGTH);
	unsigned char ciphertext[SHA256_DIGEST_LENGTH];
	SHA256_CTX c;

	SHA256_Init(&c);
	SHA256_Update(&c, plaintext.c_str(), plaintext.length());
	SHA256_Final(ciphertext, &c);

	for(int i = 0; i < SHA256_DIGEST_LENGTH; ++i) {
		ret[i] = ciphertext[i];
	}

	return ret;
}


std::string base64_encode(std::string plaintext)
{
	return base64_encode(string_to_unsigned_char(plaintext));
}

std::string base64_encode(std::vector<unsigned char> plaintext)
{
	std::string ret;
	size_t slice_num = ( plaintext.size() + 2 ) / 3;

	for(size_t i = 0; i < slice_num; ++i) {

	}

	return ret;
}

std::string base64_encode_24bit(std::vector<unsigned char> plaintext)
{
	std::string ret;

	return ret;
}

std::vector<unsigned char> base64_decode(std::string ciphertext)
{
	std::vector<unsigned char> ret;

	return ret;
}

std::vector<unsigned char> base64_decode_4char(std::string ciphertext)
{
	std::vector<unsigned char> ret;

	return ret;
}

std::vector<unsigned char> string_to_unsigned_char(std::string arg)
{
	std::vector<unsigned char> ret;

	for(size_t i = 0; i < arg.length(); ++i) {
		ret.push_back(arg[i]);
	}

	return ret;
}


} /* namespace crypt */