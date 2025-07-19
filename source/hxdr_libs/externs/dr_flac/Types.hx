package hxdr_libs.externs.dr_flac;

import cpp.SizeT;
import cpp.Callable;
import cpp.RawPointer;

/**
 * Dummy class for importing Dr_Flac native structures.
 */
extern class Types {}

@:buildXml('<include name="${haxelib:hxdr_libs}/project/Build.xml" />')
@:include('dr_flac.h')
@:native('drflac_int16')
@:scalar
@:coreType
@:notNull
extern abstract DrFlac_Int16 from cpp.Int16 to cpp.Int16 {}

@:buildXml('<include name="${haxelib:hxdr_libs}/project/Build.xml" />')
@:include('dr_flac.h')
@:native('drflac_uint32')
@:scalar
@:coreType
@:notNull
extern abstract DrFlac_UInt32 from cpp.UInt32 to cpp.UInt32 {}

@:buildXml('<include name="${haxelib:hxdr_libs}/project/Build.xml" />')
@:include('dr_flac.h')
@:native('drflac_uint64')
@:scalar
@:coreType
@:notNull
extern abstract DrFlac_UInt64 from cpp.UInt64 to cpp.UInt64 {}

@:buildXml('<include name="${haxelib:hxdr_libs}/project/Build.xml" />')
@:include('dr_flac.h')
@:unreflective
@:structAccess
@:native('drflac_allocation_callbacks')
extern class DrFlac_Allocation_Callbacks
{
	function new():Void;

	var pUserData:RawPointer<cpp.Void>;
	var onMalloc:Callable<(sz:SizeT, pUserData:RawPointer<cpp.Void>) -> RawPointer<cpp.Void>>;
	var onRealloc:Callable<(p:RawPointer<cpp.Void>, sz:SizeT, pUserData:RawPointer<cpp.Void>) -> RawPointer<cpp.Void>>;
	var onFree:Callable<(sz:SizeT, pUserData:RawPointer<cpp.Void>) -> Void>;
}
