package hxdr_libs;

#if lime
import cpp.Int16;
import cpp.Pointer;
import cpp.RawPointer;
import cpp.Stdlib;

import haxe.io.Bytes;
import haxe.io.BytesData;

import hxdr_libs.externs.dr_flac.DrFlac;
import hxdr_libs.externs.dr_flac.Types;

import lime.media.AudioBuffer;
import lime.utils.UInt8Array;

using cpp.NativeArray;

class Flac
{
	/**
	 * Decodes FLAC audio data from bytes using `dr_flac`.
	 * 
	 * @param bytes The FLAC-encoded audio data.
	 * @return AudioBuffer containing decoded 16-bit PCM audio data.
	 */
	public static function fromBytes(bytes:Bytes):AudioBuffer
	{
		final audioBuffer:AudioBuffer = new AudioBuffer();

		{
			final channels:DrFlac_UInt32 = 0;
			final sampleRate:DrFlac_UInt32 = 0;
			final totalPCMFrameCount:DrFlac_UInt64 = 0;

			final pcmFrames:RawPointer<DrFlac_Int16> = DrFlac.open_memory_and_read_pcm_frames_s16(untyped Pointer.arrayElem(bytes.getData(), 0).raw,
				bytes.length, Pointer.addressOf(channels).raw, Pointer.addressOf(sampleRate).raw, cast Pointer.addressOf(totalPCMFrameCount).raw, null);

			{
				audioBuffer.bitsPerSample = 16;
				audioBuffer.channels = channels;
				audioBuffer.sampleRate = sampleRate;

				final pcmData:BytesData = new BytesData();
				pcmData.setUnmanagedData(untyped pcmFrames, untyped totalPCMFrameCount * Stdlib.sizeof(Int16) * channels);
				audioBuffer.data = UInt8Array.fromBytes(Bytes.ofData(pcmData.copy()));
			}

			DrFlac.free(untyped pcmFrames, null);
		}

		return audioBuffer;
	}

	/**
	 * Decodes FLAC audio file using `dr_flac`.
	 * 
	 * @param path Path to the FLAC audio file.
	 * @return AudioBuffer containing decoded 16-bit PCM audio data.
	 */
	public static function fromFile(path:String):AudioBuffer
	{
		final audioBuffer:AudioBuffer = new AudioBuffer();

		{
			final channels:DrFlac_UInt32 = 0;
			final sampleRate:DrFlac_UInt32 = 0;
			final totalPCMFrameCount:DrFlac_UInt64 = 0;

			final pcmFrames:RawPointer<DrFlac_Int16> = DrFlac.open_file_and_read_pcm_frames_s16(path, Pointer.addressOf(channels).raw,
				Pointer.addressOf(sampleRate).raw, cast Pointer.addressOf(totalPCMFrameCount).raw, null);

			{
				audioBuffer.bitsPerSample = 16;
				audioBuffer.channels = channels;
				audioBuffer.sampleRate = sampleRate;

				final pcmData:BytesData = new BytesData();
				pcmData.setUnmanagedData(untyped pcmFrames, untyped totalPCMFrameCount * Stdlib.sizeof(Int16) * channels);
				audioBuffer.data = UInt8Array.fromBytes(Bytes.ofData(pcmData.copy()));
			}

			DrFlac.free(untyped pcmFrames, null);
		}

		return audioBuffer;
	}
}
#end
