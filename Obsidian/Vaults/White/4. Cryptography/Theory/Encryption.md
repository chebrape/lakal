## Encryption
​
Transforming data into ciphertext, using a cipher.
​
​
### [Key Terms]
- #### Ciphertext:
  The result of encrypting a plaintext, encrypted data
​
- #### Cipher:
  A method of encrypting or decrypting data. Modern ciphers are cryptographic, but there are many non cryptographic ciphers like Caesar.
​
- #### Plaintext:
  Data before encryption, often text but not always. Could be a photograph or other file
​
- #### Encryption:
  Transforming data into ciphertext, using a cipher.
​
- #### Encoding:
  NOT a form of encryption, just a form of data representation like base64. Immediately reversible.
​
- #### Key:
  Some information that is needed to correctly decrypt the ciphertext and obtain the plaintext.
​
- #### Passphrase:
  Separate to the key, a passphrase is similar to a password and used to protect a key.
​
- #### Asymmetric encryption:
  Uses different keys to encrypt and decrypt.
​
- #### Symmetric encryption:
  Uses the same key to encrypt and decrypt
​
- #### Brute force:
  Attacking cryptography by trying every different password or every different key
​
- #### Cryptanalysis:
  Attacking cryptography by finding a weakness in the underlying maths
​
- #### Alice and Bob:
  Used to represent 2 people who generally want to communicate. They’re named Alice and Bob because this gives them the initials A and B. https://en.wikipedia.org/wiki/Alice_and_Bob for more information, as these extend through the alphabet to represent many different people involved in communication.
​
​
### Types of Encryption
​
- #### Symmetric encryption
  Uses the same key to encrypt and decrypt the data. Examples of Symmetric encryption are DES (Broken) and AES. These algorithms tend to be faster than asymmetric cryptography, and use smaller keys (128 or 256 bit keys are common for AES, DES keys are 56 bits long).
  ​​
- #### Asymmetric encryption
  Uses a pair of keys, one to encrypt and the other in the pair to decrypt. Examples are RSA and Elliptic Curve Cryptography. Normally these keys are referred to as a public key and a private key. Data encrypted with the private key can be decrypted with the public key, and vice versa. Your private key needs to be kept private, hence the name. Asymmetric encryption tends to be slower and uses larger keys, for example RSA typically uses 2048 to 4096 bit keys.