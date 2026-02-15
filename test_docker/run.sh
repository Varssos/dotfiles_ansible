#!/bin/bash


if [ "$1" == "all" ]; then
    # Run tests for the most important versions
    VERSIONS=("22.04" "24.04" "25.10")
else
    # Run tests on the latest LTS version
    VERSIONS=("24.04")
fi


ROOT_DIR=$(pwd)

for v in "${VERSIONS[@]}"; do
	ver_no=${v//./}
	tag="ubuntu${ver_no}-test"
	name="ubuntu${ver_no}"

	echo "Building ${tag} (FROM ubuntu:${v})..."
	docker rm -f "${name}" >/dev/null 2>&1 || true
	docker build --build-arg UBUNTU_VERSION=${v} -t "${tag}" . || { echo "Build failed for ${v}"; exit 1; }

    # Run on the same port as the version number (e.g., 2204 for 22.04, 2404 for 24.04)
	echo "Running ${name} on port ${ver_no}..."
	docker run -d --name "${name}" -p ${ver_no}:22 "${tag}"

done

# Return to project root and run ansible tests
cd "${ROOT_DIR}/.."
if [ "$1" == "all" ]; then
    echo "Running Ansible tests for all versions..."
    ansible-playbook test_run.yml
else
    echo "Running Ansible tests for Ubuntu 24.04..."
    ansible-playbook test_run.yml --limit "ubuntu2404"
fi
