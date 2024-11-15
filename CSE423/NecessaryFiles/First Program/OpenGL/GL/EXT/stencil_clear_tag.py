'''OpenGL extension EXT.stencil_clear_tag

This module customises the behaviour of the 
OpenGL.raw.GL.EXT.stencil_clear_tag to provide a more 
Python-friendly API

Overview (from the spec)
	
	Stencil-only framebuffer clears are increasingly common as 3D
	applications are now using rendering algorithms such as stenciled
	shadow volume rendering for multiple light sources in a single frame,
	recent "soft" stenciled shadow volume techniques, and stencil-based
	constructive solid geometry techniques.  In such algorithms there
	are multiple stencil buffer clears for each depth buffer clear.
	Additionally in most cases, these algorithms do not require all
	of the 8 typical stencil bitplanes for their stencil requirements.
	In such cases, there is the potential for unused stencil bitplanes
	to encode a "stencil clear tag" in such a way to reduce the number
	of actual stencil clears.  The idea is that switching to an unused
	stencil clear tag logically corresponds to when an application would
	otherwise perform a framebuffer-wide stencil clear.
	
	This extension exposes an inexpensive hardware mechanism for
	amortizing the cost of multiple stencil-only clears by using a
	client-specified number of upper bits of the stencil buffer to
	maintain a per-pixel stencil tag.
	
	The upper bits of each stencil value is treated as a tag that
	indicates the state of the upper bits of the "stencil clear tag" state
	when the stencil value was last written.  If a stencil value is read
	and its upper bits containing its tag do NOT match the current upper
	bits of the stencil clear tag state, the stencil value is substituted
	with the lower bits of the stencil clear tag (the reset value).
	Either way, the upper tag bits of the stencil value are ignored by
	subsequent stencil function and operation processing of the stencil
	value.
	
	When a stencil value is written to the stencil buffer, its upper bits
	are overridden with the upper bits of the current stencil clear tag
	state so subsequent reads, prior to any subsequent stencil clear
	tag state change, properly return the updated lower bits.
	
	In this way, the stencil clear tag functionality provides a way to
	replace multiple bandwidth-intensive stencil clears with very
	inexpensive update of the stencil clear tag state.
	
	If used as expected with the client specifying 3 bits for the stencil
	tag, every 7 of 8 stencil-only clears of the entire stencil buffer can
	be substituted for an update of the current stencil clear tag rather
	than an actual update of all the framebuffer's stencil values.  Still,
	every 8th clear must be an actual stencil clear.  The net effect is
	that the aggregate cost of stencil clears is reduced by a factor of
	1/(2^n) where n is the number of bits devoted to the stencil tag.
	
	The application specifies two new pieces of state: 1) the number of
	upper stencil bits, n,  assigned to maintain the tag bits for each
	stencil value within the stencil buffer, and 2) a stencil clear tag
	value that packs the current tag and a reset value into a single
	integer values.  The upper n bits of the stencil clear tag value
	specify the current tag while the lower s-min(n,s) bits specify
	the current reset value, where s is the number of bitplanes in the
	stencil buffer and n is the current number of stencil tag bits.
	
	If zero stencil clear tag bits are assigned to the stencil tag
	encoding, then the stencil buffer operates in the conventional
	manner.

The official definition of this extension is available here:
http://www.opengl.org/registry/specs/EXT/stencil_clear_tag.txt
'''
from OpenGL import platform, constant, arrays
from OpenGL import extensions, wrapper
import ctypes
from OpenGL.raw.GL import _types, _glgets
from OpenGL.raw.GL.EXT.stencil_clear_tag import *
from OpenGL.raw.GL.EXT.stencil_clear_tag import _EXTENSION_NAME

def glInitStencilClearTagEXT():
    '''Return boolean indicating whether this extension is available'''
    from OpenGL import extensions
    return extensions.hasGLExtension( _EXTENSION_NAME )


### END AUTOGENERATED SECTION