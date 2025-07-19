package hxdr_libs.externs.dr_wav;

import cpp.ConstCharStar;
import cpp.RawConstPointer;
import cpp.RawPointer;
import cpp.SizeT;

import hxdr_libs.externs.dr_wav.Types;

@:buildXml('<include name="${haxelib:hxdr_libs}/project/Build.xml" />')
@:include('dr_wav.h')
extern class DrWav
{
	@:native('drwav_open_file_and_read_pcm_frames_s16')
	static function open_file_and_read_pcm_frames_s16(filename:ConstCharStar, channels:RawPointer<DrWav_UInt32>, sampleRate:RawPointer<DrWav_UInt32>,
		totalPCMFrameCount:RawPointer<DrWav_UInt64>, pAllocationCallbacks:RawConstPointer<DrWav_Allocation_Callbacks>):RawPointer<DrWav_Int16>;

	@:native('drwav_open_memory_and_read_pcm_frames_s16')
	static function open_memory_and_read_pcm_frames_s16(data:RawConstPointer<cpp.Void>, dataSize:SizeT, channels:RawPointer<DrWav_UInt32>,
		sampleRate:RawPointer<DrWav_UInt32>, totalPCMFrameCount:RawPointer<DrWav_UInt64>,
		pAllocationCallbacks:RawConstPointer<DrWav_Allocation_Callbacks>):RawPointer<DrWav_Int16>;

	@:native('drwav_free')
	static function free(p:RawPointer<cpp.Void>, pAllocationCallbacks:RawConstPointer<DrWav_Allocation_Callbacks>):Void;
}
