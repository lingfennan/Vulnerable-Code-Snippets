#!/bin/bash
cd /src/
# run codeql 
if [ -s cpp-db ];then
	rm -r cpp-db
fi
echo "Install the dependencies for compiling the repository"
echo "Create the codeql database" 
ls -alht ./
codeql database create cpp-db --language=cpp --command=make
echo "Run the queries to find results"
codeql database analyze -j0 cpp-db /root/codeql-repo/cpp/ql/src/Likely\ Bugs/ \
	/root/codeql-repo/cpp/ql/src/Best\ Practices/ \
	/root/codeql-repo/cpp/ql/src/Critical/ \
	/root/codeql-repo/cpp/ql/src/experimental/ \
	/root/codeql-repo/cpp/ql/src/bad-overflow-guard/ \
	/root/codeql-repo/cpp/ql/src/Security/CWE/CWE-191 \
	--format=csv --output cpp-results.csv

