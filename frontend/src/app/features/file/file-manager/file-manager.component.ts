import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

export interface FileItem {
  id: number;
  name: string;
  type: 'file' | 'folder';
  size?: number;
  mimeType?: string;
  uploadedBy: string;
  uploadedDate: string;
  category: string;
  isShared: boolean;
  permissions: string[];
}

@Component({
  selector: 'app-file-manager',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="space-y-6">
      <!-- Header -->
      <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 class="text-2xl font-bold text-gray-900">File Manager</h1>
          <p class="text-gray-600">Manage documents, attachments, and files</p>
        </div>
        <div class="flex flex-wrap gap-3">
          <button
            (click)="showUploadModal = true"
            class="bg-primary-600 text-white px-4 py-2 rounded-md hover:bg-primary-700 transition-colors">
            <i class="fas fa-upload mr-2"></i>
            Upload Files
          </button>
          <button
            (click)="createFolder()"
            class="bg-gray-600 text-white px-4 py-2 rounded-md hover:bg-gray-700 transition-colors">
            <i class="fas fa-folder-plus mr-2"></i>
            New Folder
          </button>
        </div>
      </div>

      <!-- Breadcrumb -->
      <nav class="flex" aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-3">
          <li class="inline-flex items-center">
            <button
              (click)="navigateToPath('/')"
              class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600">
              <i class="fas fa-home mr-2"></i>
              Home
            </button>
          </li>
          <li *ngFor="let segment of currentPathSegments; let i = index">
            <div class="flex items-center">
              <i class="fas fa-chevron-right text-gray-400 mx-1"></i>
              <button
                (click)="navigateToPath(getPathUpTo(i))"
                class="text-sm font-medium text-gray-700 hover:text-blue-600">
                {{ segment }}
              </button>
            </div>
          </li>
        </ol>
      </nav>

      <!-- Filters and Search -->
      <div class="bg-white rounded-lg shadow border border-gray-200 p-4">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Search</label>
            <input
              type="text"
              [(ngModel)]="searchTerm"
              placeholder="Search files..."
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500">
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Category</label>
            <select
              [(ngModel)]="selectedCategory"
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500">
              <option value="">All Categories</option>
              <option value="Documents">Documents</option>
              <option value="Images">Images</option>
              <option value="Reports">Reports</option>
              <option value="Procedures">Procedures</option>
              <option value="Certificates">Certificates</option>
            </select>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Type</label>
            <select
              [(ngModel)]="selectedType"
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500">
              <option value="">All Types</option>
              <option value="folder">Folders</option>
              <option value="file">Files</option>
            </select>
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">View</label>
            <div class="flex space-x-2">
              <button
                (click)="viewMode = 'grid'"
                [class.bg-primary-600]="viewMode === 'grid'"
                [class.text-white]="viewMode === 'grid'"
                [class.bg-gray-200]="viewMode !== 'grid'"
                class="px-3 py-2 rounded-md transition-colors">
                <i class="fas fa-th"></i>
              </button>
              <button
                (click)="viewMode = 'list'"
                [class.bg-primary-600]="viewMode === 'list'"
                [class.text-white]="viewMode === 'list'"
                [class.bg-gray-200]="viewMode !== 'list'"
                class="px-3 py-2 rounded-md transition-colors">
                <i class="fas fa-list"></i>
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- File Stats -->
      <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
        <div class="bg-white rounded-lg shadow border border-gray-200 p-4">
          <div class="flex items-center">
            <i class="fas fa-folder text-blue-500 text-2xl mr-3"></i>
            <div>
              <p class="text-sm text-gray-600">Folders</p>
              <p class="text-xl font-bold text-gray-900">{{ getFolderCount() }}</p>
            </div>
          </div>
        </div>
        <div class="bg-white rounded-lg shadow border border-gray-200 p-4">
          <div class="flex items-center">
            <i class="fas fa-file text-green-500 text-2xl mr-3"></i>
            <div>
              <p class="text-sm text-gray-600">Files</p>
              <p class="text-xl font-bold text-gray-900">{{ getFileCount() }}</p>
            </div>
          </div>
        </div>
        <div class="bg-white rounded-lg shadow border border-gray-200 p-4">
          <div class="flex items-center">
            <i class="fas fa-hdd text-yellow-500 text-2xl mr-3"></i>
            <div>
              <p class="text-sm text-gray-600">Total Size</p>
              <p class="text-xl font-bold text-gray-900">{{ getTotalSize() }}</p>
            </div>
          </div>
        </div>
        <div class="bg-white rounded-lg shadow border border-gray-200 p-4">
          <div class="flex items-center">
            <i class="fas fa-share text-purple-500 text-2xl mr-3"></i>
            <div>
              <p class="text-sm text-gray-600">Shared</p>
              <p class="text-xl font-bold text-gray-900">{{ getSharedCount() }}</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Files Grid View -->
      <div *ngIf="viewMode === 'grid'" class="bg-white rounded-lg shadow border border-gray-200 p-6">
        <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-4">
          <div
            *ngFor="let item of getFilteredFiles()"
            (click)="selectFile(item)"
            (dblclick)="openFile(item)"
            class="flex flex-col items-center p-4 rounded-lg border-2 border-transparent hover:border-primary-300 hover:bg-primary-50 cursor-pointer transition-colors"
            [class.border-primary-500]="selectedFiles.has(item.id)"
            [class.bg-primary-100]="selectedFiles.has(item.id)">

            <!-- File Icon -->
            <div class="w-12 h-12 flex items-center justify-center mb-2">
              <i
                *ngIf="item.type === 'folder'"
                class="fas fa-folder text-blue-500 text-3xl"></i>
              <i
                *ngIf="item.type === 'file'"
                [class]="getFileIcon(item.mimeType)"
                class="text-3xl"></i>
            </div>

            <!-- File Name -->
            <span class="text-xs text-center text-gray-700 truncate w-full" [title]="item.name">
              {{ item.name }}
            </span>

            <!-- File Size -->
            <span *ngIf="item.type === 'file'" class="text-xs text-gray-500 mt-1">
              {{ formatFileSize(item.size) }}
            </span>
          </div>
        </div>

        <!-- Empty State -->
        <div *ngIf="getFilteredFiles().length === 0" class="text-center py-12">
          <i class="fas fa-folder-open text-gray-400 text-4xl mb-4"></i>
          <h3 class="text-lg font-medium text-gray-900 mb-2">No files found</h3>
          <p class="text-gray-600">Upload files or create folders to get started</p>
        </div>
      </div>

      <!-- Files List View -->
      <div *ngIf="viewMode === 'list'" class="bg-white rounded-lg shadow border border-gray-200 overflow-hidden">
        <table class="min-w-full divide-y divide-gray-200">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Name
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Size
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Type
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Uploaded By
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Date
              </th>
              <th class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                Actions
              </th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
            <tr
              *ngFor="let item of getFilteredFiles()"
              (click)="selectFile(item)"
              class="hover:bg-gray-50 cursor-pointer"
              [class.bg-primary-50]="selectedFiles.has(item.id)">

              <td class="px-6 py-4 whitespace-nowrap">
                <div class="flex items-center">
                  <i
                    [class]="item.type === 'folder' ? 'fas fa-folder text-blue-500' : getFileIcon(item.mimeType)"
                    class="mr-3"></i>
                  <div>
                    <div class="text-sm font-medium text-gray-900">{{ item.name }}</div>
                    <div *ngIf="item.isShared" class="text-xs text-blue-600">
                      <i class="fas fa-share mr-1"></i>Shared
                    </div>
                  </div>
                </div>
              </td>

              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                {{ item.type === 'file' ? formatFileSize(item.size) : '-' }}
              </td>

              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                {{ item.type === 'folder' ? 'Folder' : item.mimeType }}
              </td>

              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                {{ item.uploadedBy }}
              </td>

              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                {{ formatDate(item.uploadedDate) }}
              </td>

              <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                <div class="flex justify-end space-x-2">
                  <button
                    (click)="downloadFile(item); $event.stopPropagation()"
                    *ngIf="item.type === 'file'"
                    class="text-blue-600 hover:text-blue-900 p-1"
                    title="Download">
                    <i class="fas fa-download"></i>
                  </button>
                  <button
                    (click)="shareFile(item); $event.stopPropagation()"
                    class="text-green-600 hover:text-green-900 p-1"
                    title="Share">
                    <i class="fas fa-share"></i>
                  </button>
                  <button
                    (click)="deleteFile(item); $event.stopPropagation()"
                    class="text-red-600 hover:text-red-900 p-1"
                    title="Delete">
                    <i class="fas fa-trash"></i>
                  </button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>

        <!-- Empty State -->
        <div *ngIf="getFilteredFiles().length === 0" class="text-center py-12">
          <i class="fas fa-folder-open text-gray-400 text-4xl mb-4"></i>
          <h3 class="text-lg font-medium text-gray-900 mb-2">No files found</h3>
          <p class="text-gray-600">Upload files or create folders to get started</p>
        </div>
      </div>

      <!-- Upload Modal -->
      <div *ngIf="showUploadModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full z-50">
        <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
          <div class="mt-3">
            <h3 class="text-lg font-medium text-gray-900 mb-4">Upload Files</h3>

            <!-- Drag & Drop Area -->
            <div
              class="border-2 border-dashed border-gray-300 rounded-lg p-8 text-center hover:border-primary-400 transition-colors"
              (dragover)="onDragOver($event)"
              (dragleave)="onDragLeave($event)"
              (drop)="onDrop($event)">
              <i class="fas fa-cloud-upload-alt text-gray-400 text-3xl mb-4"></i>
              <p class="text-gray-600 mb-2">Drag and drop files here</p>
              <p class="text-sm text-gray-500 mb-4">or</p>
              <input
                type="file"
                multiple
                #fileInput
                (change)="onFileSelect($event)"
                class="hidden">
              <button
                (click)="fileInput.click()"
                class="bg-primary-600 text-white px-4 py-2 rounded-md hover:bg-primary-700 transition-colors">
                Choose Files
              </button>
            </div>

            <!-- Selected Files -->
            <div *ngIf="selectedFilesForUpload.length > 0" class="mt-4">
              <h4 class="text-sm font-medium text-gray-900 mb-2">Selected Files:</h4>
              <div class="space-y-2 max-h-32 overflow-y-auto">
                <div *ngFor="let file of selectedFilesForUpload" class="flex items-center justify-between text-sm">
                  <span class="truncate">{{ file.name }}</span>
                  <button
                    (click)="removeFileFromUpload(file)"
                    class="text-red-600 hover:text-red-800 ml-2">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
            </div>

            <!-- Actions -->
            <div class="flex justify-end space-x-3 mt-6">
              <button
                (click)="closeUploadModal()"
                class="px-4 py-2 bg-gray-300 text-gray-700 rounded-md hover:bg-gray-400 transition-colors">
                Cancel
              </button>
              <button
                (click)="uploadFiles()"
                [disabled]="selectedFilesForUpload.length === 0"
                class="px-4 py-2 bg-primary-600 text-white rounded-md hover:bg-primary-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed">
                Upload {{ selectedFilesForUpload.length }} file(s)
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  `
})
export class FileManagerComponent implements OnInit {
  files: FileItem[] = [];
  filteredFiles: FileItem[] = [];
  selectedFiles = new Set<number>();
  viewMode: 'grid' | 'list' = 'grid';
  searchTerm = '';
  selectedCategory = '';
  selectedType = '';
  currentPath = '/';
  currentPathSegments: string[] = [];
  showUploadModal = false;
  selectedFilesForUpload: File[] = [];

  ngOnInit() {
    this.loadFiles();
  }

  private loadFiles() {
    // TODO: replace mock with real API call
    this.files = [
      {
        id: 1,
        name: 'Quality Manual',
        type: 'folder',
        uploadedBy: 'Admin',
        uploadedDate: '2024-01-15',
        category: 'Documents',
        isShared: true,
        permissions: ['read', 'write']
      },
      {
        id: 2,
        name: 'ISO 9001 Certificate.pdf',
        type: 'file',
        size: 2048576,
        mimeType: 'application/pdf',
        uploadedBy: 'John Smith',
        uploadedDate: '2024-01-20',
        category: 'Certificates',
        isShared: false,
        permissions: ['read']
      },
      {
        id: 3,
        name: 'Audit Report Q1 2024.docx',
        type: 'file',
        size: 1024000,
        mimeType: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
        uploadedBy: 'Jane Doe',
        uploadedDate: '2024-02-01',
        category: 'Reports',
        isShared: true,
        permissions: ['read', 'write']
      },
      {
        id: 4,
        name: 'Procedures',
        type: 'folder',
        uploadedBy: 'Admin',
        uploadedDate: '2024-01-10',
        category: 'Procedures',
        isShared: true,
        permissions: ['read']
      },
      {
        id: 5,
        name: 'Safety Guidelines.png',
        type: 'file',
        size: 512000,
        mimeType: 'image/png',
        uploadedBy: 'Mike Johnson',
        uploadedDate: '2024-01-25',
        category: 'Images',
        isShared: false,
        permissions: ['read', 'write']
      }
    ];
  }

  getFilteredFiles(): FileItem[] {
    return this.files.filter(file => {
      const matchesSearch = !this.searchTerm ||
        file.name.toLowerCase().includes(this.searchTerm.toLowerCase());
      const matchesCategory = !this.selectedCategory ||
        file.category === this.selectedCategory;
      const matchesType = !this.selectedType ||
        file.type === this.selectedType;

      return matchesSearch && matchesCategory && matchesType;
    });
  }

  selectFile(file: FileItem) {
    if (this.selectedFiles.has(file.id)) {
      this.selectedFiles.delete(file.id);
    } else {
      this.selectedFiles.add(file.id);
    }
  }

  openFile(file: FileItem) {
    if (file.type === 'folder') {
      // Navigate into folder
      this.currentPath += file.name + '/';
      this.updatePathSegments();
      // TODO: Load folder contents
    } else {
      // Open/preview file
      console.log('Opening file:', file.name);
    }
  }

  navigateToPath(path: string) {
    this.currentPath = path;
    this.updatePathSegments();
    // TODO: Load files for the new path
  }

  getPathUpTo(index: number): string {
    return '/' + this.currentPathSegments.slice(0, index + 1).join('/') + '/';
  }

  updatePathSegments() {
    this.currentPathSegments = this.currentPath
      .split('/')
      .filter(segment => segment.length > 0);
  }

  getFileIcon(mimeType?: string): string {
    if (!mimeType) return 'fas fa-file text-gray-500';

    if (mimeType.startsWith('image/')) return 'fas fa-file-image text-green-500';
    if (mimeType.includes('pdf')) return 'fas fa-file-pdf text-red-500';
    if (mimeType.includes('word') || mimeType.includes('document')) return 'fas fa-file-word text-blue-500';
    if (mimeType.includes('excel') || mimeType.includes('spreadsheet')) return 'fas fa-file-excel text-green-500';
    if (mimeType.includes('powerpoint') || mimeType.includes('presentation')) return 'fas fa-file-powerpoint text-orange-500';
    if (mimeType.includes('text')) return 'fas fa-file-alt text-gray-500';
    if (mimeType.includes('video')) return 'fas fa-file-video text-purple-500';
    if (mimeType.includes('audio')) return 'fas fa-file-audio text-yellow-500';

    return 'fas fa-file text-gray-500';
  }

  formatFileSize(bytes?: number): string {
    if (!bytes) return '-';

    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(1024));
    return Math.round(bytes / Math.pow(1024, i) * 100) / 100 + ' ' + sizes[i];
  }

  formatDate(dateString: string): string {
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', {
      month: 'short',
      day: 'numeric',
      year: 'numeric'
    });
  }

  getFolderCount(): number {
    return this.files.filter(f => f.type === 'folder').length;
  }

  getFileCount(): number {
    return this.files.filter(f => f.type === 'file').length;
  }

  getTotalSize(): string {
    const totalBytes = this.files
      .filter(f => f.type === 'file' && f.size)
      .reduce((total, f) => total + (f.size || 0), 0);
    return this.formatFileSize(totalBytes);
  }

  getSharedCount(): number {
    return this.files.filter(f => f.isShared).length;
  }

  // File upload methods
  onDragOver(event: DragEvent) {
    event.preventDefault();
    event.stopPropagation();
  }

  onDragLeave(event: DragEvent) {
    event.preventDefault();
    event.stopPropagation();
  }

  onDrop(event: DragEvent) {
    event.preventDefault();
    event.stopPropagation();

    const files = Array.from(event.dataTransfer?.files || []);
    this.selectedFilesForUpload.push(...files);
  }

  onFileSelect(event: any) {
    const files = Array.from(event.target.files || []);
    this.selectedFilesForUpload.push(...files);
  }

  removeFileFromUpload(file: File) {
    const index = this.selectedFilesForUpload.indexOf(file);
    if (index > -1) {
      this.selectedFilesForUpload.splice(index, 1);
    }
  }

  uploadFiles() {
    // TODO: Implement actual file upload
    console.log('Uploading files:', this.selectedFilesForUpload);

    // Mock: Add files to list
    this.selectedFilesForUpload.forEach((file, index) => {
      const newFile: FileItem = {
        id: this.files.length + index + 1,
        name: file.name,
        type: 'file',
        size: file.size,
        mimeType: file.type,
        uploadedBy: 'Current User',
        uploadedDate: new Date().toISOString().split('T')[0],
        category: 'Documents',
        isShared: false,
        permissions: ['read', 'write']
      };
      this.files.push(newFile);
    });

    this.closeUploadModal();
  }

  closeUploadModal() {
    this.showUploadModal = false;
    this.selectedFilesForUpload = [];
  }

  createFolder() {
    const folderName = prompt('Enter folder name:');
    if (folderName) {
      // TODO: Implement actual folder creation
      const newFolder: FileItem = {
        id: this.files.length + 1,
        name: folderName,
        type: 'folder',
        uploadedBy: 'Current User',
        uploadedDate: new Date().toISOString().split('T')[0],
        category: 'Documents',
        isShared: false,
        permissions: ['read', 'write']
      };
      this.files.push(newFolder);
    }
  }

  downloadFile(file: FileItem) {
    // TODO: Implement actual file download
    console.log('Downloading file:', file.name);
    alert('Download started for: ' + file.name);
  }

  shareFile(file: FileItem) {
    // TODO: Implement file sharing
    console.log('Sharing file:', file.name);
    file.isShared = !file.isShared;
  }

  deleteFile(file: FileItem) {
    if (confirm(`Are you sure you want to delete "${file.name}"?`)) {
      // TODO: Implement actual file deletion
      const index = this.files.findIndex(f => f.id === file.id);
      if (index > -1) {
        this.files.splice(index, 1);
      }
    }
  }
}