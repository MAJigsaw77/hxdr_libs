package hxdr_libs.externs.dr_mp3;

import cpp.ConstCharStar;
import cpp.RawConstPointer;
import cpp.RawPointer;
import cpp.SizeT;

import hxdr_libs.externs.dr_mp3.Types;

@:buildXml('<include name="${haxelib:hxdr_libs}/project/Build.xml" />')
@:include('dr_mp3.h')
extern class DrMp3
{
	@:native('drmp3_open_file_and_read_pcm_frames_s16')
	static function open_file_and_read_pcm_frames_s16(filename:ConstCharStar, pConfig:RawPointer<DrMp3_Config>, totalPCMFrameCount:RawPointer<DrMp3_UInt64>,
		pAllocationCallbacks:RawConstPointer<DrMp3_Allocation_Callbacks>):RawPointer<DrMp3_Int16>;

	@:native('drmp3_open_memory_and_read_pcm_frames_s16')
	static function open_memory_and_read_pcm_frames_s16(data:RawConstPointer<cpp.Void>, dataSize:SizeT, pConfig:RawPointer<DrMp3_Config>,
		totalPCMFrameCount:RawPointer<DrMp3_UInt64>, pAllocationCallbacks:RawConstPointer<DrMp3_Allocation_Callbacks>):RawPointer<DrMp3_Int16>;

	@:native('drmp3_free')
	static function free(p:RawPointer<cpp.Void>, pAllocationCallbacks:RawConstPointer<DrMp3_Allocation_Callbacks>):Void;
}
