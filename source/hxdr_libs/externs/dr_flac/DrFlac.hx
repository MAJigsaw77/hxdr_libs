package hxdr_libs.externs.dr_flac;

import cpp.ConstCharStar;
import cpp.RawConstPointer;
import cpp.RawPointer;
import cpp.SizeT;

import hxdr_libs.externs.dr_flac.Types;

@:buildXml('<include name="${haxelib:hxdr_libs}/project/Build.xml" />')
@:include('dr_flac.h')
extern class DrFlac
{
	@:native('drflac_open_file_and_read_pcm_frames_s16')
	static function open_file_and_read_pcm_frames_s16(filename:ConstCharStar, channels:RawPointer<DrFlac_UInt32>, sampleRate:RawPointer<DrFlac_UInt32>,
		totalPCMFrameCount:RawPointer<DrFlac_UInt64>, pAllocationCallbacks:RawConstPointer<DrFlac_Allocation_Callbacks>):RawPointer<DrFlac_Int16>;

	@:native('drflac_open_memory_and_read_pcm_frames_s16')
	static function open_memory_and_read_pcm_frames_s16(data:RawConstPointer<cpp.Void>, dataSize:SizeT, channels:RawPointer<DrFlac_UInt32>,
		sampleRate:RawPointer<DrFlac_UInt32>, totalPCMFrameCount:RawPointer<DrFlac_UInt64>,
		pAllocationCallbacks:RawConstPointer<DrFlac_Allocation_Callbacks>):RawPointer<DrFlac_Int16>;

	@:native('drflac_free')
	static function free(p:RawPointer<cpp.Void>, pAllocationCallbacks:RawConstPointer<DrFlac_Allocation_Callbacks>):Void;
}
