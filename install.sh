#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

QE_VERSION="${QE_VERSION:-7.6}"
QE_TAG="qe-${QE_VERSION}"
QE_REPO="${QE_REPO:-https://gitlab.com/QEF/q-e.git}"

SRC_DIR="${SCRIPT_DIR}/.build/q-e"
INSTALL_DIR="${INSTALL_DIR:-${SCRIPT_DIR}/install/qe-${QE_VERSION}}"

JOBS="${JOBS:-4}"

CC="${CC:-mpicc}"
MPIF90="${MPIF90:-mpif90}"

rm -rf "${SRC_DIR}"
mkdir -p "$(dirname "${SRC_DIR}")"

git clone \
    --depth 1 \
    --branch "${QE_TAG}" \
    "${QE_REPO}" \
    "${SRC_DIR}"

cd "${SRC_DIR}"

./configure \
    --prefix="${INSTALL_DIR}" \
    CC="${CC}" \
    MPIF90="${MPIF90}" \
    ${CONFIGURE_FLAGS:-}

make -j "${JOBS}" all
make install

echo "Quantum ESPRESSO ${QE_VERSION} installed at:"
echo "${INSTALL_DIR}"
