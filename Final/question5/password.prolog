% Copied from https://www.passwordrandom.com/most-popular-passwords
% (With apologies for the profanity -- apparently it is common in the
% passwords people choose).
common_password('password').
common_password('123456').
common_password('12345678').
common_password('1234').
common_password('qwerty').
common_password('12345').
common_password('dragon').
common_password('pussy').
common_password('baseball').
common_password('football').
common_password('letmein').
common_password('monkey').
common_password('696969').
common_password('abc123').
common_password('mustang').
common_password('michael').
common_password('shadow').
common_password('master').
common_password('jennifer').
common_password('111111').
common_password('2000').
common_password('jordan').
common_password('superman').
common_password('harley').
common_password('1234567').
common_password('fuckme').
common_password('hunter').
common_password('fuckyou').
common_password('trustno1').
common_password('ranger').
common_password('buster').
common_password('thomas').
common_password('tigger').
common_password('robert').
common_password('soccer').
common_password('fuck').
common_password('batman').
common_password('test').
common_password('pass').
common_password('killer').
common_password('hockey').
common_password('george').
common_password('charlie').
common_password('andrew').
common_password('michelle').
common_password('love').
common_password('sunshine').
common_password('jessica').
common_password('asshole').
common_password('6969').
common_password('pepper').
common_password('daniel').
common_password('access').
common_password('123456789').
common_password('654321').
common_password('joshua').
common_password('maggie').
common_password('starwars').
common_password('silver').
common_password('william').
common_password('dallas').
common_password('yankees').
common_password('123123').
common_password('ashley').
common_password('666666').
common_password('hello').
common_password('amanda').
common_password('orange').
common_password('biteme').
common_password('freedom').
common_password('computer').
common_password('sexy').
common_password('thunder').
common_password('nicole').
common_password('ginger').
common_password('heather').
common_password('hammer').
common_password('summer').
common_password('corvette').
common_password('taylor').
common_password('fucker').
common_password('austin').
common_password('1111').
common_password('merlin').
common_password('matthew').
common_password('121212').
common_password('golfer').
common_password('cheese').
common_password('princess').
common_password('martin').
common_password('chelsea').
common_password('patrick').
common_password('richard').
common_password('diamond').
common_password('yellow').
common_password('bigdog').
common_password('secret').
common_password('asdfgh').
common_password('sparky').
common_password('cowboy').


% Salt, Hash
stolen_hash([162, 33, 63, 56, 224, 229, 96, 52], '7a8ffb48fc1b221a5f996ba932313fe86c6487b9748b9b349e6a212a0efc4d6bea612cc8acfd00bbed311cf5aa18e10112752106d0640218f9b5f4dfb5d6f2a6').
stolen_hash([123, 10, 143, 59, 45, 40, 138, 195], 'c8f442ed103687d1d7aa910c613e2c37ab8129c8cd25006041515e639d1c6fd3e1dc44773ec75f3cdef7f7fc5d53dcbb5c3e2b577618df99f1211d1e6ae553b5').
stolen_hash([193, 0, 192, 44, 31, 16, 87, 175], '9a388c22ab49b54a2c17d993501d87030e4f49e0432bb32968658fbc5cc356f9aaf6b982c7c8b642b9a094ba8ac76515320cddc08984844e5218507cf89bb8ab').
stolen_hash([13, 101, 251, 64, 242, 162, 251, 87], '1a9e97a050255072ba52387b5bf77a52e841c15f6813214a6edafdf20f52c1df266288415133b0a8e03eea8ab4c592b623b8f9b192835dad93f988c1143340ee').
stolen_hash([130, 108, 43, 190, 18, 138, 161, 181], 'a9765fc806efa5ae705f50f28dbb237fc6f344d97639d62ddfc562b3d5ef52bb2d2b0aa5aa16fe4cdcbee051d20a6228eeb6726332171767d48476faba9ffe4d').
stolen_hash([70, 57, 136, 25, 4, 215, 16, 82], '10b39def348ead4b8a8d65b2b197e1b15c7fd62c76a74ec117739581b661be4455ad85018084706e9ac5cf33937e0978e382dee22c25f29e860ca62f68ec9c7c').
stolen_hash([79, 113, 239, 27, 150, 51, 170, 142], '5304b485bf87a2223c025ea92b4a7bd778ead2742a05076d4672df7f04a0302b3227cfc641c89bbd0d21bab9b369587afc75a9b26f0ff224e8c567736ca35e9a').
stolen_hash([6, 159, 250, 164, 77, 17, 76, 245], '600348e1cee964bb4238198f16d33fa64d2c3f0b87ae3678835a959cd769b9dcb59aa9c271a017c245895c49c2905625f1fc5ffe56f45b5568b26566e30ba0cb').
stolen_hash([83, 227, 134, 184, 136, 182, 143, 252], '27cf718a176c635a76e3b5b89678eb273330c25aacfc1c6b4c8177eab9714c91e06bd916d6204cabcce729b0d4ac60f4a639864affcbb78008ffd23b9afc3680').

% Specify a password.  A random salt value and the matching hash value will be returned.
make_password_hash(Password, Salt, H) :-
  crypto_n_random_bytes(8, Salt),
  hash_password(Password, Salt, H).

% Hashes a password and its salt value, returning the hash value.
%
% NOTE: We **should** use crypto_password_hash, but we want
% to make the exercise feasible to do for an exam question.
hash_password(Password, Salt, Hash) :-
  crypto_data_hash(Password, PreHash, [algorithm(sha512)]),
  hex_bytes(PreHash, Bytes),
  append(Bytes, Salt, TotalBytes),
  crypto_data_hash(TotalBytes, Hash, [algorithm(sha512)]).

% Test this rule out by calling:
%
%   find_password(Password, Salt).
%
% When this rule is called, it should compare common passwords
% and the stolen hash values and return any matches.  You should
% be able to determine the passwords for 6 of the 9 stolen hashes.
find_password(P, S) :-
common_password(P),
stolen_hash(S, Hash),
hash_password(P, S, H),
Hash==H.
