# This file is part of redlibssh.
# Copyright (C) 2022 Red_M

# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation, version 2.1.

# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.

# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

import enum

from . cimport c_sftp
from . cimport c_ssh
from . cimport c_ssh2
from . cimport c_callbacks

#ssh
class SSH(enum.Enum):
    MD5_DIGEST_LEN = c_ssh.MD5_DIGEST_LEN
    CRYPT = c_ssh.SSH_CRYPT
    MAC = c_ssh.SSH_MAC
    COMP = c_ssh.SSH_COMP
    LANG = c_ssh.SSH_LANG
    #Errors
    OK = c_ssh.SSH_OK
    ERROR = c_ssh.SSH_ERROR
    AGAIN = c_ssh.SSH_AGAIN
    EOF = c_ssh.SSH_EOF
    INVALID_SOCKET = c_ssh.SSH_INVALID_SOCKET
    #States
    CLOSED = c_ssh.SSH_CLOSED
    READ_PENDING = c_ssh.SSH_READ_PENDING
    CLOSED_ERROR = c_ssh.SSH_CLOSED_ERROR
    WRITE_PENDING = c_ssh.SSH_WRITE_PENDING

    class Kex(enum.Enum):
        KEX = c_ssh.SSH_KEX
        HOSTKEYS = c_ssh.SSH_HOSTKEYS
        CRYPT_C_S = c_ssh.SSH_CRYPT_C_S
        CRYPT_S_C = c_ssh.SSH_CRYPT_S_C
        MAC_C_S = c_ssh.SSH_MAC_C_S
        MAC_S_C = c_ssh.SSH_MAC_S_C
        COMP_C_S = c_ssh.SSH_COMP_C_S
        COMP_S_C = c_ssh.SSH_COMP_S_C
        LANG_C_S = c_ssh.SSH_LANG_C_S
        LANG_S_C = c_ssh.SSH_LANG_S_C

    class Auth(enum.Enum):
        SUCCESS = c_ssh.SSH_AUTH_SUCCESS
        DENIED = c_ssh.SSH_AUTH_DENIED
        PARTIAL = c_ssh.SSH_AUTH_PARTIAL
        INFO = c_ssh.SSH_AUTH_INFO
        AGAIN = c_ssh.SSH_AUTH_AGAIN
        ERROR = c_ssh.SSH_AUTH_ERROR

        class Method(enum.Enum):
            UNKNOWN = c_ssh.SSH_AUTH_METHOD_UNKNOWN
            NONE = c_ssh.SSH_AUTH_METHOD_NONE
            PASSWORD = c_ssh.SSH_AUTH_METHOD_PASSWORD
            PUBLICKEY = c_ssh.SSH_AUTH_METHOD_PUBLICKEY
            HOSTBASED = c_ssh.SSH_AUTH_METHOD_HOSTBASED
            INTERACTIVE = c_ssh.SSH_AUTH_METHOD_INTERACTIVE
            GSSAPI_MIC = c_ssh.SSH_AUTH_METHOD_GSSAPI_MIC

        # enum ssh_requests_e:
    class Request(enum.Enum):
        AUTH = c_ssh.SSH_REQUEST_AUTH
        CHANNEL_OPEN = c_ssh.SSH_REQUEST_CHANNEL_OPEN
        CHANNEL = c_ssh.SSH_REQUEST_CHANNEL
        SERVICE = c_ssh.SSH_REQUEST_SERVICE
        GLOBAL = c_ssh.SSH_REQUEST_GLOBAL

        # enum ssh_channel_type_e:
    class Channel(enum.Enum):
        UNKNOWN = c_ssh.SSH_CHANNEL_UNKNOWN
        SESSION = c_ssh.SSH_CHANNEL_SESSION
        DIRECT_TCPIP = c_ssh.SSH_CHANNEL_DIRECT_TCPIP
        FORWARDED_TCPIP = c_ssh.SSH_CHANNEL_FORWARDED_TCPIP
        X11 = c_ssh.SSH_CHANNEL_X11
        AUTH_AGENT = c_ssh.SSH_CHANNEL_AUTH_AGENT

        # enum ssh_channel_requests_e:
        class Request(enum.Enum):
            UNKNOWN = c_ssh.SSH_CHANNEL_REQUEST_UNKNOWN
            PTY = c_ssh.SSH_CHANNEL_REQUEST_PTY
            EXEC = c_ssh.SSH_CHANNEL_REQUEST_EXEC
            SHELL = c_ssh.SSH_CHANNEL_REQUEST_SHELL
            ENV = c_ssh.SSH_CHANNEL_REQUEST_ENV
            SUBSYSTEM = c_ssh.SSH_CHANNEL_REQUEST_SUBSYSTEM
            WINDOW_CHANGE = c_ssh.SSH_CHANNEL_REQUEST_WINDOW_CHANGE
            X11 = c_ssh.SSH_CHANNEL_REQUEST_X11

        # enum ssh_global_requests_e:
    class Global(enum.Enum):
        class Request(enum.Enum):
            UNKNOWN = c_ssh.SSH_GLOBAL_REQUEST_UNKNOWN
            TCPIP_FORWARD = c_ssh.SSH_GLOBAL_REQUEST_TCPIP_FORWARD
            CANCEL_TCPIP_FORWARD = c_ssh.SSH_GLOBAL_REQUEST_CANCEL_TCPIP_FORWARD
            KEEPALIVE = c_ssh.SSH_GLOBAL_REQUEST_KEEPALIVE

        # enum ssh_publickey_state_e:
    class PublicKeyState(enum.Enum):
        ERROR = c_ssh.SSH_PUBLICKEY_STATE_ERROR
        NONE = c_ssh.SSH_PUBLICKEY_STATE_NONE
        VALID = c_ssh.SSH_PUBLICKEY_STATE_VALID
        WRONG = c_ssh.SSH_PUBLICKEY_STATE_WRONG

        # enum ssh_server_known_e:
    class Server(enum.Enum):
        ERROR = c_ssh.SSH_SERVER_ERROR
        NOT_KNOWN = c_ssh.SSH_SERVER_NOT_KNOWN
        KNOWN_OK = c_ssh.SSH_SERVER_KNOWN_OK
        KNOWN_CHANGED = c_ssh.SSH_SERVER_KNOWN_CHANGED
        FOUND_OTHER = c_ssh.SSH_SERVER_FOUND_OTHER
        FILE_NOT_FOUND = c_ssh.SSH_SERVER_FILE_NOT_FOUND

        # Errors
        # enum ssh_error_types_e:
    class ErrorTypes(enum.Enum):
        NO_ERROR = c_ssh.SSH_NO_ERROR
        REQUEST_DENIED = c_ssh.SSH_REQUEST_DENIED
        FATAL = c_ssh.SSH_FATAL
        EINTR = c_ssh.SSH_EINTR

        # enum ssh_keytypes_e:
    class KeyType(enum.Enum):
        UNKNOWN = c_ssh.SSH_KEYTYPE_UNKNOWN
        DSS = c_ssh.SSH_KEYTYPE_DSS
        RSA = c_ssh.SSH_KEYTYPE_RSA
        RSA1 = c_ssh.SSH_KEYTYPE_RSA1
        ECDSA = c_ssh.SSH_KEYTYPE_ECDSA  # Deprecated
        ED25519 = c_ssh.SSH_KEYTYPE_ED25519
        DSS_CERT01 = c_ssh.SSH_KEYTYPE_DSS_CERT01
        RSA_CERT01 = c_ssh.SSH_KEYTYPE_RSA_CERT01
        ECDSA_P256 = c_ssh.SSH_KEYTYPE_ECDSA_P256
        ECDSA_P384 = c_ssh.SSH_KEYTYPE_ECDSA_P384
        ECDSA_P521 = c_ssh.SSH_KEYTYPE_ECDSA_P521
        ECDSA_P256_CERT01 = c_ssh.SSH_KEYTYPE_ECDSA_P256_CERT01
        ECDSA_P384_CERT01 = c_ssh.SSH_KEYTYPE_ECDSA_P384_CERT01
        ECDSA_P521_CERT01 = c_ssh.SSH_KEYTYPE_ECDSA_P521_CERT01
        ED25519_CERT01 = c_ssh.SSH_KEYTYPE_ED25519_CERT01

        # enum ssh_keycmp_e:
    class KeyCMP(enum.Enum):
        PUBLIC = c_ssh.SSH_KEY_CMP_PUBLIC
        PRIVATE = c_ssh.SSH_KEY_CMP_PRIVATE

    class Log(enum.Enum):
        NOLOG = c_ssh.SSH_LOG_NOLOG
        PROTOCOL = c_ssh.SSH_LOG_PROTOCOL
        PACKET = c_ssh.SSH_LOG_PACKET
        FUNCTIONS = c_ssh.SSH_LOG_FUNCTIONS
        RARE = c_ssh.SSH_LOG_RARE
        NONE = c_ssh.SSH_LOG_NONE
        WARN = c_ssh.SSH_LOG_WARN
        INFO = c_ssh.SSH_LOG_INFO
        DEBUG = c_ssh.SSH_LOG_DEBUG
        TRACE = c_ssh.SSH_LOG_TRACE

        # enum ssh_options_e:
    class Options(enum.Enum):
        HOST = c_ssh.SSH_OPTIONS_HOST
        PORT = c_ssh.SSH_OPTIONS_PORT
        PORT_STR = c_ssh.SSH_OPTIONS_PORT_STR
        FD = c_ssh.SSH_OPTIONS_FD
        USER = c_ssh.SSH_OPTIONS_USER
        SSH_DIR = c_ssh.SSH_OPTIONS_SSH_DIR
        IDENTITY = c_ssh.SSH_OPTIONS_IDENTITY
        ADD_IDENTITY = c_ssh.SSH_OPTIONS_ADD_IDENTITY
        KNOWNHOSTS = c_ssh.SSH_OPTIONS_KNOWNHOSTS
        TIMEOUT = c_ssh.SSH_OPTIONS_TIMEOUT
        TIMEOUT_USEC = c_ssh.SSH_OPTIONS_TIMEOUT_USEC
        SSH1 = c_ssh.SSH_OPTIONS_SSH1
        SSH2 = c_ssh.SSH_OPTIONS_SSH2
        LOG_VERBOSITY = c_ssh.SSH_OPTIONS_LOG_VERBOSITY
        LOG_VERBOSITY_STR = c_ssh.SSH_OPTIONS_LOG_VERBOSITY_STR
        CIPHERS_C_S = c_ssh.SSH_OPTIONS_CIPHERS_C_S
        CIPHERS_S_C = c_ssh.SSH_OPTIONS_CIPHERS_S_C
        COMPRESSION_C_S = c_ssh.SSH_OPTIONS_COMPRESSION_C_S
        COMPRESSION_S_C = c_ssh.SSH_OPTIONS_COMPRESSION_S_C
        PROXYCOMMAND = c_ssh.SSH_OPTIONS_PROXYCOMMAND
        BINDADDR = c_ssh.SSH_OPTIONS_BINDADDR
        STRICTHOSTKEYCHECK = c_ssh.SSH_OPTIONS_STRICTHOSTKEYCHECK
        COMPRESSION = c_ssh.SSH_OPTIONS_COMPRESSION
        COMPRESSION_LEVEL = c_ssh.SSH_OPTIONS_COMPRESSION_LEVEL
        KEY_EXCHANGE = c_ssh.SSH_OPTIONS_KEY_EXCHANGE
        HOSTKEYS = c_ssh.SSH_OPTIONS_HOSTKEYS
        GSSAPI_SERVER_IDENTITY = c_ssh.SSH_OPTIONS_GSSAPI_SERVER_IDENTITY
        GSSAPI_CLIENT_IDENTITY = c_ssh.SSH_OPTIONS_GSSAPI_CLIENT_IDENTITY
        GSSAPI_DELEGATE_CREDENTIALS = c_ssh.SSH_OPTIONS_GSSAPI_DELEGATE_CREDENTIALS
        HMAC_C_S = c_ssh.SSH_OPTIONS_HMAC_C_S
        HMAC_S_C = c_ssh.SSH_OPTIONS_HMAC_S_C
        PASSWORD_AUTH = c_ssh.SSH_OPTIONS_PASSWORD_AUTH
        PUBKEY_AUTH = c_ssh.SSH_OPTIONS_PUBKEY_AUTH
        KBDINT_AUTH = c_ssh.SSH_OPTIONS_KBDINT_AUTH
        GSSAPI_AUTH = c_ssh.SSH_OPTIONS_GSSAPI_AUTH
        GLOBAL_KNOWNHOSTS = c_ssh.SSH_OPTIONS_GLOBAL_KNOWNHOSTS
        NODELAY = c_ssh.SSH_OPTIONS_NODELAY

    class SCP(enum.Enum):
        WRITE = c_ssh.SSH_SCP_WRITE
        READ = c_ssh.SSH_SCP_READ
        RECURSIVE = c_ssh.SSH_SCP_RECURSIVE
            # enum ssh_scp_request_types:
        class Request(enum.Enum):
            NEWDIR = c_ssh.SSH_SCP_REQUEST_NEWDIR
            NEWFILE = c_ssh.SSH_SCP_REQUEST_NEWFILE
            EOF = c_ssh.SSH_SCP_REQUEST_EOF
            ENDDIR = c_ssh.SSH_SCP_REQUEST_ENDDIR
            WARNING = c_ssh.SSH_SCP_REQUEST_WARNING

        # enum ssh_connector_flags_e:
    class Connector(enum.Enum):
        STDOUT = c_ssh.SSH_CONNECTOR_STDOUT
        STDERR = c_ssh.SSH_CONNECTOR_STDERR
        BOTH = c_ssh.SSH_CONNECTOR_BOTH
    #callbacks
    class Callbacks(enum.Enum):
        class Socket(enum.Enum):
            FLOW_WRITEWILLBLOCK = c_callbacks.SSH_SOCKET_FLOW_WRITEWILLBLOCK
            FLOW_WRITEWONTBLOCK = c_callbacks.SSH_SOCKET_FLOW_WRITEWONTBLOCK
            EXCEPTION_EOF = c_callbacks.SSH_SOCKET_EXCEPTION_EOF
            EXCEPTION_ERROR = c_callbacks.SSH_SOCKET_EXCEPTION_ERROR
            CONNECTED_OK = c_callbacks.SSH_SOCKET_CONNECTED_OK
            CONNECTED_ERROR = c_callbacks.SSH_SOCKET_CONNECTED_ERROR
            CONNECTED_TIMEOUT = c_callbacks.SSH_SOCKET_CONNECTED_TIMEOUT

#ssh2
class SSH2(enum.Enum):
    class Msg(enum.Enum):
        DISCONNECT = c_ssh2.SSH2_MSG_DISCONNECT
        IGNORE = c_ssh2.SSH2_MSG_IGNORE
        UNIMPLEMENTED = c_ssh2.SSH2_MSG_UNIMPLEMENTED
        DEBUG = c_ssh2.SSH2_MSG_DEBUG
        SERVICE_REQUEST = c_ssh2.SSH2_MSG_SERVICE_REQUEST
        SERVICE_ACCEPT = c_ssh2.SSH2_MSG_SERVICE_ACCEPT
        KEXINIT = c_ssh2.SSH2_MSG_KEXINIT
        NEWKEYS = c_ssh2.SSH2_MSG_NEWKEYS
        ECMQV_INIT = c_ssh2.SSH2_MSG_ECMQV_INIT
        ECMQV_REPLY = c_ssh2.SSH2_MSG_ECMQV_REPLY
        KEXDH_INIT = c_ssh2.SSH2_MSG_KEXDH_INIT
        KEXDH_REPLY = c_ssh2.SSH2_MSG_KEXDH_REPLY
        class Kex(enum.Enum):
            ECDH_INIT = c_ssh2.SSH2_MSG_KEX_ECDH_INIT
            ECDH_REPLY = c_ssh2.SSH2_MSG_KEX_ECDH_REPLY
            DH_GEX_REQUEST_OLD = c_ssh2.SSH2_MSG_KEX_DH_GEX_REQUEST_OLD
            DH_GEX_GROUP = c_ssh2.SSH2_MSG_KEX_DH_GEX_GROUP
            DH_GEX_INIT = c_ssh2.SSH2_MSG_KEX_DH_GEX_INIT
            DH_GEX_REPLY = c_ssh2.SSH2_MSG_KEX_DH_GEX_REPLY
            DH_GEX_REQUEST = c_ssh2.SSH2_MSG_KEX_DH_GEX_REQUEST
        class UserAuth(enum.Enum):
            REQUEST = c_ssh2.SSH2_MSG_USERAUTH_REQUEST
            FAILURE = c_ssh2.SSH2_MSG_USERAUTH_FAILURE
            SUCCESS = c_ssh2.SSH2_MSG_USERAUTH_SUCCESS
            BANNER = c_ssh2.SSH2_MSG_USERAUTH_BANNER
            PK_OK = c_ssh2.SSH2_MSG_USERAUTH_PK_OK
            PASSWD_CHANGEREQ = c_ssh2.SSH2_MSG_USERAUTH_PASSWD_CHANGEREQ
            INFO_REQUEST = c_ssh2.SSH2_MSG_USERAUTH_INFO_REQUEST
            GSSAPI_RESPONSE = c_ssh2.SSH2_MSG_USERAUTH_GSSAPI_RESPONSE
            INFO_RESPONSE = c_ssh2.SSH2_MSG_USERAUTH_INFO_RESPONSE
            GSSAPI_TOKEN = c_ssh2.SSH2_MSG_USERAUTH_GSSAPI_TOKEN
            GSSAPI_EXCHANGE_COMPLETE = c_ssh2.SSH2_MSG_USERAUTH_GSSAPI_EXCHANGE_COMPLETE
            GSSAPI_ERROR = c_ssh2.SSH2_MSG_USERAUTH_GSSAPI_ERROR
            GSSAPI_ERRTOK = c_ssh2.SSH2_MSG_USERAUTH_GSSAPI_ERRTOK
            GSSAPI_MIC = c_ssh2.SSH2_MSG_USERAUTH_GSSAPI_MIC
        class Global(enum.Enum):
            REQUEST = c_ssh2.SSH2_MSG_GLOBAL_REQUEST
        class Request(enum.Enum):
            SUCCESS = c_ssh2.SSH2_MSG_REQUEST_SUCCESS
            FAILURE = c_ssh2.SSH2_MSG_REQUEST_FAILURE
        class Channel(enum.Enum):
            OPEN = c_ssh2.SSH2_MSG_CHANNEL_OPEN
            OPEN_CONFIRMATION = c_ssh2.SSH2_MSG_CHANNEL_OPEN_CONFIRMATION
            OPEN_FAILURE = c_ssh2.SSH2_MSG_CHANNEL_OPEN_FAILURE
            WINDOW_ADJUST = c_ssh2.SSH2_MSG_CHANNEL_WINDOW_ADJUST
            DATA = c_ssh2.SSH2_MSG_CHANNEL_DATA
            EXTENDED_DATA = c_ssh2.SSH2_MSG_CHANNEL_EXTENDED_DATA
            EOF = c_ssh2.SSH2_MSG_CHANNEL_EOF
            CLOSE = c_ssh2.SSH2_MSG_CHANNEL_CLOSE
            REQUEST = c_ssh2.SSH2_MSG_CHANNEL_REQUEST
            SUCCESS = c_ssh2.SSH2_MSG_CHANNEL_SUCCESS
            FAILURE = c_ssh2.SSH2_MSG_CHANNEL_FAILURE
    class Disconnect(enum.Enum):
            HOST_NOT_ALLOWED_TO_CONNECT = c_ssh2.SSH2_DISCONNECT_HOST_NOT_ALLOWED_TO_CONNECT
            PROTOCOL_ERROR = c_ssh2.SSH2_DISCONNECT_PROTOCOL_ERROR
            KEY_EXCHANGE_FAILED = c_ssh2.SSH2_DISCONNECT_KEY_EXCHANGE_FAILED
            HOST_AUTHENTICATION_FAILED = c_ssh2.SSH2_DISCONNECT_HOST_AUTHENTICATION_FAILED
            RESERVED = c_ssh2.SSH2_DISCONNECT_RESERVED
            MAC_ERROR = c_ssh2.SSH2_DISCONNECT_MAC_ERROR
            COMPRESSION_ERROR = c_ssh2.SSH2_DISCONNECT_COMPRESSION_ERROR
            SERVICE_NOT_AVAILABLE = c_ssh2.SSH2_DISCONNECT_SERVICE_NOT_AVAILABLE
            PROTOCOL_VERSION_NOT_SUPPORTED = c_ssh2.SSH2_DISCONNECT_PROTOCOL_VERSION_NOT_SUPPORTED
            HOST_KEY_NOT_VERIFIABLE = c_ssh2.SSH2_DISCONNECT_HOST_KEY_NOT_VERIFIABLE
            CONNECTION_LOST = c_ssh2.SSH2_DISCONNECT_CONNECTION_LOST
            BY_APPLICATION = c_ssh2.SSH2_DISCONNECT_BY_APPLICATION
            TOO_MANY_CONNECTIONS = c_ssh2.SSH2_DISCONNECT_TOO_MANY_CONNECTIONS
            AUTH_CANCELLED_BY_USER = c_ssh2.SSH2_DISCONNECT_AUTH_CANCELLED_BY_USER
            NO_MORE_AUTH_METHODS_AVAILABLE = c_ssh2.SSH2_DISCONNECT_NO_MORE_AUTH_METHODS_AVAILABLE
            ILLEGAL_USER_NAME = c_ssh2.SSH2_DISCONNECT_ILLEGAL_USER_NAME
    class Open(enum.Enum):
            ADMINISTRATIVELY_PROHIBITED = c_ssh2.SSH2_OPEN_ADMINISTRATIVELY_PROHIBITED
            CONNECT_FAILED = c_ssh2.SSH2_OPEN_CONNECT_FAILED
            UNKNOWN_CHANNEL_TYPE = c_ssh2.SSH2_OPEN_UNKNOWN_CHANNEL_TYPE
            RESOURCE_SHORTAGE = c_ssh2.SSH2_OPEN_RESOURCE_SHORTAGE
    class ExtendedData(enum.Enum):
        STDERR = c_ssh2.SSH2_EXTENDED_DATA_STDERR

#sftp
class SFTP(enum.Enum):
    OPEN = c_sftp.SFTP_OPEN
    CLOSE = c_sftp.SFTP_CLOSE
    READ = c_sftp.SFTP_READ
    WRITE = c_sftp.SFTP_WRITE
    LSTAT = c_sftp.SFTP_LSTAT
    FSTAT = c_sftp.SFTP_FSTAT
    SETSTAT = c_sftp.SFTP_SETSTAT
    FSETSTAT = c_sftp.SFTP_FSETSTAT
    OPENDIR = c_sftp.SFTP_OPENDIR
    READDIR = c_sftp.SFTP_READDIR
    REMOVE = c_sftp.SFTP_REMOVE
    MKDIR = c_sftp.SFTP_MKDIR
    RMDIR = c_sftp.SFTP_RMDIR
    REALPATH = c_sftp.SFTP_REALPATH
    STAT = c_sftp.SFTP_STAT
    RENAME = c_sftp.SFTP_RENAME
    READLINK = c_sftp.SFTP_READLINK
    SYMLINK = c_sftp.SFTP_SYMLINK
    class FXP(enum.Enum):
        INIT = c_sftp.SSH_FXP_INIT
        VERSION = c_sftp.SSH_FXP_VERSION
        OPEN = c_sftp.SSH_FXP_OPEN
        CLOSE = c_sftp.SSH_FXP_CLOSE
        READ = c_sftp.SSH_FXP_READ
        WRITE = c_sftp.SSH_FXP_WRITE
        LSTAT = c_sftp.SSH_FXP_LSTAT
        FSTAT = c_sftp.SSH_FXP_FSTAT
        SETSTAT = c_sftp.SSH_FXP_SETSTAT
        FSETSTAT = c_sftp.SSH_FXP_FSETSTAT
        OPENDIR = c_sftp.SSH_FXP_OPENDIR
        READDIR = c_sftp.SSH_FXP_READDIR
        REMOVE = c_sftp.SSH_FXP_REMOVE
        MKDIR = c_sftp.SSH_FXP_MKDIR
        RMDIR = c_sftp.SSH_FXP_RMDIR
        REALPATH = c_sftp.SSH_FXP_REALPATH
        STAT = c_sftp.SSH_FXP_STAT
        RENAME = c_sftp.SSH_FXP_RENAME
        READLINK = c_sftp.SSH_FXP_READLINK
        SYMLINK = c_sftp.SSH_FXP_SYMLINK
        STATUS = c_sftp.SSH_FXP_STATUS
        HANDLE = c_sftp.SSH_FXP_HANDLE
        DATA = c_sftp.SSH_FXP_DATA
        NAME = c_sftp.SSH_FXP_NAME
        ATTRS = c_sftp.SSH_FXP_ATTRS
        EXTENDED = c_sftp.SSH_FXP_EXTENDED
        EXTENDED_REPLY = c_sftp.SSH_FXP_EXTENDED_REPLY
    class FileXfer(enum.Enum):
        class Attr(enum.Enum):
            SIZE = c_sftp.SSH_FILEXFER_ATTR_SIZE
            PERMISSIONS = c_sftp.SSH_FILEXFER_ATTR_PERMISSIONS
            ACCESSTIME = c_sftp.SSH_FILEXFER_ATTR_ACCESSTIME
            ACMODTIME = c_sftp.SSH_FILEXFER_ATTR_ACMODTIME
            CREATETIME = c_sftp.SSH_FILEXFER_ATTR_CREATETIME
            MODIFYTIME = c_sftp.SSH_FILEXFER_ATTR_MODIFYTIME
            ACL = c_sftp.SSH_FILEXFER_ATTR_ACL
            OWNERGROUP = c_sftp.SSH_FILEXFER_ATTR_OWNERGROUP
            SUBSECOND_TIMES = c_sftp.SSH_FILEXFER_ATTR_SUBSECOND_TIMES
            EXTENDED = c_sftp.SSH_FILEXFER_ATTR_EXTENDED
            UIDGID = c_sftp.SSH_FILEXFER_ATTR_UIDGID
    # Types
        class Type(enum.Enum):
            REGULAR = c_sftp.SSH_FILEXFER_TYPE_REGULAR
            DIRECTORY = c_sftp.SSH_FILEXFER_TYPE_DIRECTORY
            SYMLINK = c_sftp.SSH_FILEXFER_TYPE_SYMLINK
            SPECIAL = c_sftp.SSH_FILEXFER_TYPE_SPECIAL
            UNKNOWN = c_sftp.SSH_FILEXFER_TYPE_UNKNOWN
    class FX(enum.Enum):
        OK = c_sftp.SSH_FX_OK
        EOF = c_sftp.SSH_FX_EOF
        NO_SUCH_FILE = c_sftp.SSH_FX_NO_SUCH_FILE
        PERMISSION_DENIED = c_sftp.SSH_FX_PERMISSION_DENIED
        FAILURE = c_sftp.SSH_FX_FAILURE
        BAD_MESSAGE = c_sftp.SSH_FX_BAD_MESSAGE
        NO_CONNECTION = c_sftp.SSH_FX_NO_CONNECTION
        CONNECTION_LOST = c_sftp.SSH_FX_CONNECTION_LOST
        OP_UNSUPPORTED = c_sftp.SSH_FX_OP_UNSUPPORTED
        INVALID_HANDLE = c_sftp.SSH_FX_INVALID_HANDLE
        NO_SUCH_PATH = c_sftp.SSH_FX_NO_SUCH_PATH
        FILE_ALREADY_EXISTS = c_sftp.SSH_FX_FILE_ALREADY_EXISTS
        WRITE_PROTECT = c_sftp.SSH_FX_WRITE_PROTECT
        NO_MEDIA = c_sftp.SSH_FX_NO_MEDIA
    class FXF(enum.Enum):
        READ = c_sftp.SSH_FXF_READ
        WRITE = c_sftp.SSH_FXF_WRITE
        APPEND = c_sftp.SSH_FXF_APPEND
        CREAT = c_sftp.SSH_FXF_CREAT
        TRUNC = c_sftp.SSH_FXF_TRUNC
        EXCL = c_sftp.SSH_FXF_EXCL
        TEXT = c_sftp.SSH_FXF_TEXT
        class Rename(enum.Enum):
            OVERWRITE = c_sftp.SSH_FXF_RENAME_OVERWRITE
            ATOMIC = c_sftp.SSH_FXF_RENAME_ATOMIC
            NATIVE = c_sftp.SSH_FXF_RENAME_NATIVE
    class S(enum.Enum):
        IFMT = c_sftp.SSH_S_IFMT
        IFSOCK = c_sftp.SSH_S_IFSOCK
        IFLNK = c_sftp.SSH_S_IFLNK
        IFREG = c_sftp.SSH_S_IFREG
        IFBLK = c_sftp.SSH_S_IFBLK
        IFDIR = c_sftp.SSH_S_IFDIR
        IFCHR = c_sftp.SSH_S_IFCHR
        IFIFO = c_sftp.SSH_S_IFIFO
    class FXE(enum.Enum):
        STATVFS_ST_RDONLY = c_sftp.SSH_FXE_STATVFS_ST_RDONLY
        STATVFS_ST_NOSUID = c_sftp.SSH_FXE_STATVFS_ST_NOSUID
