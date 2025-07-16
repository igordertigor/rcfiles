import os
import sys

print('Hello')

if hasattr(sys,'ps1') and os.getenv('DEBUGPY_ENABLE'):
    try:
        import debugpy
        port = int(os.getenv('DEBUGPY_PORT',5678))
        debugpy.listen(port)
        print(f"debugpy listening on 127.0.0.1:{port}", flush=True)
        debugpy.wait_for_client()
    except ImportError:
        print('Could not import debugpy')
