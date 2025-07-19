package hxdr_libs;

#if lime
import cpp.Int16;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Stdlib;
import cpp.UInt32;
import cpp.UInt64;

import haxe.io.Bytes;
import haxe.io.BytesData;

import hxdr_libs.externs.dr_wav.DrWav;
import hxdr_libs.externs.dr_wav.Types;

import lime.media.AudioBuffer;
import lime.utils.UInt8Array;

using cpp.NativeArray;

class Wav
{
	/**
	 * Decodes WAV audio data from bytes using `dr_wav`.
	 * 
	 * @param bytes The WAV-encoded audio data.
	 * @return AudioBuffer containing decoded 16-bit PCM audio data.
	 */
	public static function fromBytes(bytes:Bytes):AudioBuffer
	{
		final audioBuffer:AudioBuffer = new AudioBuffer();

		{
			final channels:DrWav_UInt32 = 0;
			final sampleRate:DrWav_UInt32 = 0;
			final totalPCMFrameCount:DrWav_UInt64 = 0;
			final pcmFrames:RawPointer<DrWav_Int16> = DrWav.open_memory_and_read_pcm_frames_s16(untyped Pointer.arrayElem(bytes.getData(), 0).raw, bytes.length,
				Pointer.addressOf(channels).raw, Pointer.addressOf(sampleRate).raw, cast Pointer.addressOf(totalPCMFrameCount).raw, null);

			{
				audioBuffer.bitsPerSample = 16;
				audioBuffer.channels = channels;
				audioBuffer.sampleRate = sampleRate;

				final pcmData:BytesData = new BytesData();
				pcmData.setUnmanagedData(untyped pcmFrames, untyped totalPCMFrameCount * Stdlib.sizeof(Int16) * channels);
				audioBuffer.data = UInt8Array.fromBytes(Bytes.ofData(pcmData.copy()));
			}

			DrWav.free(untyped pcmFrames, null);
		}

		return audioBuffer;
	}

	/**
	 * Decodes WAV audio file using `dr_wav`.
	 * 
	 * @param path Path to the WAV audio file.
	 * @return AudioBuffer containing decoded 16-bit PCM audio data.
	 */
	public static function fromFile(path:String):AudioBuffer
	{
		final audioBuffer:AudioBuffer = new AudioBuffer();

		{
			final channels:DrWav_UInt32 = 0;
			final sampleRate:DrWav_UInt32 = 0;
			final totalPCMFrameCount:DrWav_UInt64 = 0;
			final pcmFrames:RawPointer<DrWav_Int16> = DrWav.open_file_and_read_pcm_frames_s16(path, Pointer.addressOf(channels).raw,
				Pointer.addressOf(sampleRate).raw, cast Pointer.addressOf(totalPCMFrameCount).raw, null);

			{
				audioBuffer.bitsPerSample = 16;
				audioBuffer.channels = channels;
				audioBuffer.sampleRate = sampleRate;

				final pcmData:BytesData = new BytesData();
				pcmData.setUnmanagedData(untyped pcmFrames, untyped totalPCMFrameCount * Stdlib.sizeof(Int16) * channels);
				audioBuffer.data = UInt8Array.fromBytes(Bytes.ofData(pcmData.copy()));
			}

			DrWav.free(untyped pcmFrames, null);
		}

		return audioBuffer;
	}
}
#end
