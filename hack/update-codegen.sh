#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_ROOT=$(dirname "${BASH_SOURCE[@]}")/..

TOOLS_DIR=$(realpath ./hack/tools)
TOOLS_BIN_DIR="${TOOLS_DIR}/bin"
GO_INSTALL=$(realpath ./hack/go-install.sh)
CONTROLLER_GEN_VER=v0.11.1
CONTROLLER_GEN_BIN=controller-gen
CONTROLLER_GEN=${TOOLS_BIN_DIR}/${CONTROLLER_GEN_BIN}-${CONTROLLER_GEN_VER}

GOBIN=${TOOLS_BIN_DIR} ${GO_INSTALL} sigs.k8s.io/controller-tools/cmd/controller-gen ${CONTROLLER_GEN_BIN} ${CONTROLLER_GEN_VER}

CODEGEN_PKG=${CODEGEN_PKG:-$(cd "${SCRIPT_ROOT}"; ls -d -1 ./vendor/k8s.io/code-generator 2>/dev/null || echo ../code-generator)}

bash "${CODEGEN_PKG}"/generate-internal-groups.sh \
  "deepcopy,conversion,defaulter" \
  github.com/gocrane/crane-scheduler/apis/generated \
  github.com/gocrane/crane-scheduler/apis \
  github.com/gocrane/crane-scheduler/apis \
  "config:v1,v1beta2,v1beta3" \
  --trim-path-prefix crane-scheduler \
  --output-base "../../../" \
  --go-header-file "${SCRIPT_ROOT}"/hack/boilerplate.go.txt

bash "${CODEGEN_PKG}"/generate-internal-groups.sh \
  "deepcopy,conversion,defaulter" \
  github.com/gocrane/crane-scheduler/apis/pkg/generated \
  github.com/gocrane/crane-scheduler/apis \
  github.com/gocrane/crane-scheduler/apis\
  "policy:v1alpha1" \
  --trim-path-prefix crane-scheduler \
  --output-base "../../../" \
  --go-header-file "${SCRIPT_ROOT}"/hack/boilerplate.go.txt
