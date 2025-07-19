package hxdr_libs;

#if lime
import cpp.Int16;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Stdlib;
import cpp.UInt64;

import haxe.io.Bytes;
import haxe.io.BytesData;

import hxdr_libs.externs.dr_mp3.DrMp3;
import hxdr_libs.externs.dr_mp3.Types;

import lime.media.AudioBuffer;
import lime.utils.UInt8Array;

using cpp.NativeArray;

class Mp3
{
	/**
	 * Decodes MP3 audio data from bytes using `dr_mp3`.
	 * 
	 * @param bytes The MP3-encoded audio data.
	 * @return AudioBuffer containing decoded 16-bit PCM audio data.
	 */
	public static function fromBytes(bytes:Bytes):AudioBuffer
	{
		final audioBuffer:AudioBuffer = new AudioBuffer();

		{
			final totalPCMFrameCount:DrMp3_UInt64 = 0;
			final config:DrMp3_Config = new DrMp3_Config();
			final pcmFrames:RawPointer<DrMp3_Int16> = DrMp3.open_memory_and_read_pcm_frames_s16(untyped Pointer.arrayElem(bytes.getData(), 0).raw, bytes.length,
				Pointer.addressOf(config).raw, cast Pointer.addressOf(totalPCMFrameCount).raw, null);

			{
				audioBuffer.bitsPerSample = 16;
				audioBuffer.channels = config.channels;
				audioBuffer.sampleRate = config.sampleRate;

				final pcmData:BytesData = new BytesData();
				pcmData.setUnmanagedData(untyped pcmFrames, untyped totalPCMFrameCount * Stdlib.sizeof(Int16) * config.channels);
				audioBuffer.data = UInt8Array.fromBytes(Bytes.ofData(pcmData.copy()));
			}

			DrMp3.free(untyped pcmFrames, null);
		}

		return audioBuffer;
	}

	/**
	 * Decodes MP3 audio file using `dr_mp3`.
	 * 
	 * @param path Path to the MP3 audio file.
	 * @return AudioBuffer containing decoded 16-bit PCM audio data.
	 */
	public static function fromFile(path:String):AudioBuffer
	{
		final audioBuffer:AudioBuffer = new AudioBuffer();

		{
			final totalPCMFrameCount:DrMp3_UInt64 = 0;
			final config:DrMp3_Config = new DrMp3_Config();
			final pcmFrames:RawPointer<DrMp3_Int16> = DrMp3.open_file_and_read_pcm_frames_s16(path, Pointer.addressOf(config).raw,
				cast Pointer.addressOf(totalPCMFrameCount).raw, null);

			{
				audioBuffer.bitsPerSample = 16;
				audioBuffer.channels = config.channels;
				audioBuffer.sampleRate = config.sampleRate;

				final pcmData:BytesData = new BytesData();
				pcmData.setUnmanagedData(untyped pcmFrames, untyped totalPCMFrameCount * Stdlib.sizeof(Int16) * config.channels);
				audioBuffer.data = UInt8Array.fromBytes(Bytes.ofData(pcmData.copy()));
			}

			DrMp3.free(untyped pcmFrames, null);
		}

		return audioBuffer;
	}
}
#end
