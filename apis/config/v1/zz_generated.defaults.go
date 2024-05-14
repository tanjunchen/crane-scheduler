//go:build !ignore_autogenerated
// +build !ignore_autogenerated

// Code generated by defaulter-gen. DO NOT EDIT.

package v1

import (
	runtime "k8s.io/apimachinery/pkg/runtime"
)

// RegisterDefaults adds defaulters functions to the given scheme.
// Public to allow building arbitrary schemes.
// All generated defaulters are covering - they call all nested defaulters.
func RegisterDefaults(scheme *runtime.Scheme) error {
	scheme.AddTypeDefaultingFunc(&DynamicArgs{}, func(obj interface{}) { SetObjectDefaults_DynamicArgs(obj.(*DynamicArgs)) })
	scheme.AddTypeDefaultingFunc(&NodeResourceTopologyMatchArgs{}, func(obj interface{}) {
		SetObjectDefaults_NodeResourceTopologyMatchArgs(obj.(*NodeResourceTopologyMatchArgs))
	})
	return nil
}

func SetObjectDefaults_DynamicArgs(in *DynamicArgs) {
	SetDefaults_DynamicArgs(in)
}

func SetObjectDefaults_NodeResourceTopologyMatchArgs(in *NodeResourceTopologyMatchArgs) {
	SetDefaults_NodeResourceTopologyMatchArgs(in)
}
