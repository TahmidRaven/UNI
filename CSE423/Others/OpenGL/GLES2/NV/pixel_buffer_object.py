'''OpenGL extension NV.pixel_buffer_object

This module customises the behaviour of the 
OpenGL.raw.GLES2.NV.pixel_buffer_object to provide a more 
Python-friendly API

Overview (from the spec)
	
	This extension permits buffer objects to be used not only with vertex
	array data, but also with pixel data.  The intent is to provide more
	acceleration opportunities for OpenGL pixel commands.
	
	While a single buffer object can be bound for both vertex arrays and
	pixel commands, we use the designations vertex buffer object (VBO)
	and pixel buffer object (PBO) to indicate their particular usage in
	a given situation.
	
	This extension does not add any new functionality to buffer objects
	themselves.  It simply adds two new targets to which buffer objects
	can be bound: GL_PIXEL_PACK_BUFFER_NV and GL_PIXEL_UNPACK_BUFFER_NV.
	When a buffer object is bound to the GL_PIXEL_PACK_BUFFER_NV target,
	commands such as glReadPixels pack (write) their data into a buffer
	object. When a buffer object is bound to the GL_PIXEL_UNPACK_BUFFER_NV
	target, commands such as glTexImage2D unpack (read) their
	data from a buffer object.
	
	There are a several approaches to improve graphics performance
	with PBOs.  Some of the most interesting approaches are:
	
	- Streaming texture updates:  If the application uses
	  glMapBufferOES/glMapBufferRangeEXT/glUnmapBufferOES to write
	  its data for glTexSubImage into a buffer object, at least one of
	  the data copies usually required to download a texture can be
	  eliminated, significantly increasing texture download performance.
	
	- Asynchronous glReadPixels:  If an application needs to read back a
	  number of images and process them with the CPU, the existing GL
	  interface makes it nearly impossible to pipeline this operation.
	  The driver will typically send the hardware a readback command
	  when glReadPixels is called, and then wait for all of the data to
	  be available before returning control to the application.  Then,
	  the application can either process the data immediately or call
	  glReadPixels again; in neither case will the readback overlap with
	  the processing.  If the application issues several readbacks
	  into several buffer objects, however, and then maps each one to
	  process its data, then the readbacks can proceed in parallel with
	  the data processing.
	
	- Render to vertex array:  The application can use a fragment
	  program to render some image into one of its buffers, then read
	  this image out into a buffer object via glReadPixels.  Then, it can
	  use this buffer object as a source of vertex data.
	

The official definition of this extension is available here:
http://www.opengl.org/registry/specs/NV/pixel_buffer_object.txt
'''
from OpenGL import platform, constant, arrays
from OpenGL import extensions, wrapper
import ctypes
from OpenGL.raw.GLES2 import _types, _glgets
from OpenGL.raw.GLES2.NV.pixel_buffer_object import *
from OpenGL.raw.GLES2.NV.pixel_buffer_object import _EXTENSION_NAME

def glInitPixelBufferObjectNV():
    '''Return boolean indicating whether this extension is available'''
    from OpenGL import extensions
    return extensions.hasGLExtension( _EXTENSION_NAME )


### END AUTOGENERATED SECTION